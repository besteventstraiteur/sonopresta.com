<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>New Order Alert</title>
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
      background: #fff;
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
  <div class="email-body" style="background: #f5f5f5; padding: 30px;">
    <div class="email-content" style="width: 40%; background: #fbfbfb; margin: 20px auto;">
      <div class="email-header" style="background: #db2777; color: white; padding: 15px;">
        <h2 style="margin: 0px; font-family: Arial;">Nouvelle commande reçue</h2>
      </div>
      <div class="email-body" style="padding: 20px; font-size: 16px; font-family: Arial;">
        <p><strong>Numéro de commande:</strong> <?php echo $data['order_id']; ?></p>
        <p><strong>Nom du client:</strong> <?php echo $data['customer_name']; ?></p>
        <p><strong>E-mail du client:</strong> <?php echo $data['email']; ?></p>
        <p><strong>Téléphone du client:</strong> <?php echo $data['phone']; ?></p>
        <p><strong>Adresse de livraison:</strong> <?php echo $data['shipping_address']; ?></p>

        <h3 style="margin-top: 25px;">Articles de commande</h3>
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

        <table style="margin-top: 15px;">
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

        <p style="margin-top: 25px;">You can view and manage this order from your dashboard. The PDF invoice is attached below for your reference.</p>
      </div>
    </div>
  </div>
</body>
</html>
