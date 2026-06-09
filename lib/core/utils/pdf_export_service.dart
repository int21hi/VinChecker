import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../features/vin/domain/entities/vin_entity.dart';

class PdfExportService {
  static Future<void> exportVehicleDetailsToPdf(VinEntity vehicle) async {
    final pdf = pw.Document();

    final formattedDate = DateFormat(
      'dd MMMM yyyy, HH:mm',
    ).format(vehicle.scannedAt);

    // Prepare additional fields from rawResults, excluding main ones and internal error fields
    final excludedKeys = {
      'Make',
      'Model',
      'Model Year',
      'Series',
      'Model Family',
      'Family',
      'Body Class',
      'Vehicle Type',
      'Plant Country',
      'Error Code',
      'Error Text',
    };

    final additionalFields = vehicle.rawResults.entries
        .where(
          (e) =>
              !excludedKeys.contains(e.key) &&
              e.value != null &&
              e.value.toString().trim().isNotEmpty,
        )
        .toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (pw.Context context) {
          return [
            // Header
            pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 30),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Vehicle Details Report',
                    style: pw.TextStyle(
                      fontSize: 28,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'Generated on $formattedDate',
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
                  ),
                ],
              ),
            ),

            // VIN Section
            pw.Container(
              padding: const pw.EdgeInsets.all(20),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.blueAccent, width: 2),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Vehicle Identification Number',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.grey700,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    vehicle.vin,
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      font: pw.Font.courier(),
                    ),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 30),

            // Core Details Section
            pw.Text(
              'Core Vehicle Information',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 12),

            pw.TableHelper.fromTextArray(
              cellAlignment: pw.Alignment.centerLeft,
              headerDecoration: pw.BoxDecoration(
                color: PdfColors.grey300,
                border: pw.Border.all(color: PdfColors.black),
              ),
              // cellDecoration: pw.BoxDecoration(
              //   border: pw.Border.all(color: PdfColors.grey300),
              // ),
              headerHeight: 25,
              headers: ['Field', 'Value'],
              data: [
                ['Make', vehicle.make],
                ['Model', vehicle.model],
                ['Model Year', vehicle.modelYear],
                ['Vehicle Type', vehicle.vehicleType],
                ['Body Class', vehicle.bodyClass],
                ['Model Family (Series)', vehicle.family],
                ['Plant Country', vehicle.plantCountry],
              ],
            ),

            pw.SizedBox(height: 30),

            // Additional Details Section
            if (additionalFields.isNotEmpty) ...[
              pw.Text(
                'Additional Vehicle Details',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 12),
              pw.TableHelper.fromTextArray(
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration: pw.BoxDecoration(
                  color: PdfColors.grey300,
                  border: pw.Border.all(color: PdfColors.black),
                ),
                // cellDecoration: pw.BoxDecoration(
                //   border: pw.Border.all(color: PdfColors.grey300),
                // ),
                headerHeight: 25,
                headers: ['Field', 'Value'],
                data: additionalFields
                    .map((e) => [e.key, e.value.toString()])
                    .toList(),
              ),
              pw.SizedBox(height: 30),
            ],

            // Footer
            pw.Divider(),
            pw.SizedBox(height: 10),
            pw.Text(
              'This vehicle data was decoded using the official NHTSA (National Highway Traffic Safety Administration) API. '
              'The information is accurate as of the decoding date.',
              style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            ),
          ];
        },
      ),
    );

    // Save and share the PDF
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'VIN_${vehicle.vin}_Details.pdf',
    );
  }
}
