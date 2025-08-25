<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Summary</title>
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
        <h2 style="margin: 0px; font-family: Arial;">Récapitulatif de la commande</h2>
      </div>
      <div class="email-body" style="padding: 20px; font-size: 17px; font-family: Arial;">
        <p style="margin-top: 0px;">Bonjour <b><?php echo $data['customer_name']; ?></b>,</p>
        <p>Merci pour votre commande ! Voici un récapitulatif de votre achat :</p>

        <table>
          <tbody>
            <tr>
              <th>Numéro de commande</th>
              <td><?php echo $data['order_id']; ?></td>
            </tr>
            <tr>
              <th>Nom du client</th>
              <td><?php echo $data['customer_name']; ?></td>
            </tr>
            <tr>
              <th>E-mail du client</th>
              <td><?php echo $data['email']; ?></td>
            </tr>
            <tr>
              <th>Téléphone du client</th>
              <td><?php echo $data['phone']; ?></td>
            </tr>
            <tr>
              <th>Adresse de livraison</th>
              <td><?php echo $data['shipping_address']; ?></td>
            </tr>
          </tbody>
        </table>

        <h3 style="margin-top: 30px;">Articles de commande:</h3>
        <table>
          <thead>
            <tr>
              <th>Produit</th>
              <th>Qty</th>
              <th>Prix</th>
              <th>Subtotal</th>
              <th>Rabais</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($data['items'] as $item): ?>
              <tr>
                <td><?php echo $item['name']; ?></td>
                <td><?php echo $item['qty']; ?></td>
                <td><?php echo number_format($item['price']); ?>€</td>
                <td><?php echo number_format($item['qty'] * $item['price']); ?>€</td>
                <td><?php echo number_format($item['discount']); ?>€</td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <table style="margin-top: 20px;">
          <tbody>
            <?php if($data['rental_start_date'] != null){ ?>
            <tr>
              <th>Date de location</th>
              <td><?php echo date('d/m/Y', strtotime($data['rental_start_date'])).' - '.date('d/m/Y', strtotime($data['rental_end_date'])); ?></td>
            </tr>
            <?php } ?>
            <tr>
              <th>Subtotal</th>
              <td><?php echo number_format($data['subtotal']); ?>€</td>
            </tr>
            <tr>
              <th>Expédition</th>
              <td><?php echo number_format($data['shipping']); ?>€</td>
            </tr>
            <tr>
              <th>Rabais</th>
              <td><?php echo number_format($data['discount']); ?>€</td>
            </tr>
            <tr>
              <th>Total</th>
              <td><strong><?php echo number_format($data['total']); ?>€</strong></td>
            </tr>
          </tbody>
        </table>

        <p style="margin-top: 30px;">Pour toute question, n'hésitez pas à nous contacter. La facture au format PDF est jointe ci-dessous.</p>
      </div>
    </div>
  </div>
</body>
</html>
