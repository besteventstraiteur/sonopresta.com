<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nouveau message ticket SAV</title>
  <style>
    @media only screen and (max-width: 600px) {
      .email-container {
        width: 100% !important;
        padding: 20px !important;
      }
      .email-header h2 {
        font-size: 20px !important;
      }
      .email-body p {
        font-size: 16px !important;
      }
    }
  </style>
</head>
<body>
  <div class="email-container" style="background: #fff; padding: 30px;">
    <div style="max-width: 600px; margin: auto; background: #fbfbfb; border: 1px solid #eee; font-family: Arial;">
      
      <!-- Header -->
      <div class="email-header" style="background: #db2777; color: white; padding: 15px;">
        <h2 style="margin: 0;">Nouveau message sur votre ticket SAV</h2>
      </div>

      <!-- Body -->
      <div class="email-body" style="padding: 20px; color: #333;">
        <p>Bonjour <strong>{{ $data['receiver_name'] }}</strong>,</p>
        
        <p>Un nouveau message a été ajouté à votre ticket SAV.</p>

        <table style="width: 100%; margin: 20px 0; font-size: 16px;">
          <tr>
            <td><strong>Ticket ID:</strong></td>
            <td>{{ $data['ticket_id'] }}</td>
          </tr>
          <tr>
            <td><strong>Nom du ticket:</strong></td>
            <td>{{ $data['ticket_title'] }}</td>
          </tr>
          <tr>
            <td><strong>Envoyé par:</strong></td>
            <td>{{ $data['sender_name'] }}</td>
          </tr>
        </table>

        <div style="border-left: 4px solid #2563eb; background: #f4f8ff; padding: 15px; margin: 20px 0; font-style: italic;">
          "{{ $data['message'] }}"
        </div>

        <p>Vous pouvez consulter le ticket complet et répondre via votre espace client.</p>

        <p style="margin-bottom: 0;">Merci,</p>
        <p style="margin-top: 0;">L'équipe support</p>
      </div>

    </div>
  </div>
</body>
</html>
