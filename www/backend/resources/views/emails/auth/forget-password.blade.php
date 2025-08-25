<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password Mail</title>
    <style>
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
                <h2 style="margin: 0px; font-family: Arial;">Demande de réinitialisation du mot de passe</h2>
            </div>
            <div class="email-body" style="padding: 20px; font-size: 17px; font-family: Arial;">
                <p style="margin-top: 0px;">Bonjour <b>{{ $data['name'] }}</b>,</p>
                <p>Nous avons reçu une demande de réinitialisation de votre mot de passe. Pour terminer cette procédure, veuillez utiliser le mot de passe à usage unique (OTP) suivant.</p>

                <?php 
                    $otp = $data['code'];
                ?>
                <div style="background: #f0f0f0; border: 1px dashed #ccc; padding: 15px; text-align: center; font-size: 20px; font-weight: bold; margin: 20px 0;">
                    {{ $otp }}
                </div>

                <p>Si vous n’avez pas demandé de réinitialisation de mot de passe, veuillez ignorer cet e-mail.</p>
            </div>
        </div>
    </div>
</body>
</html>
