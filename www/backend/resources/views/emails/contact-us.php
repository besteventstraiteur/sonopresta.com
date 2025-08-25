<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            background: white;
        }
        
        @media only screen and (max-width: 600px) {
            .email-body {
                padding: 20px !important;
            }
            .email-content {
                width: 100% !important;
                margin: 0 !important;
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
    <div class="email-body" style="background: #fff; padding: 30px;">
        <div class="email-content" style="width: 40%; background: #fbfbfb; margin: 20px auto;">
            <div class="email-header" style="background: #db2777; color: white; padding: 15px;">
                <h2 style="margin: 0px; font-family: Arial;">Demander un devis</h2>
            </div>
            <div class="email-body" style="padding: 20px; font-size: 17px; font-family: Arial;">
                <p style="margin-top: 0px;">Bonjour <b>Chère</b>,</p>
                <p>Vous avez une nouvelle demande de contact ! Consultez les détails ci-dessous.</p>

                <table>
                    <tbody>
                        <tr>
                            <th>Nom</th>
                            <td><?php echo $data['name'] ?></td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td><?php echo $data['email'] ?></td>
                        </tr>
                        <tr>
                            <th>Téléphone</th>
                            <td><?php echo $data['phone'] ?></td>
                        </tr>
                        <tr>
                            <th>Type de projet</th>
                            <td><?php echo $data['project_type'] ?></td>
                        </tr>
                        <tr>
                            <th>Message</th>
                            <td><?php echo $data['message'] ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
