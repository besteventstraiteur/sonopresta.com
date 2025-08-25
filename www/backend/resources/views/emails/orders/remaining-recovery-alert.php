<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Today's Recoveries</title>
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
    <div class="email-content" style="width: 100%; background: #fbfbfb; margin: 20px auto;">
      <div class="email-header" style="background: #db2777; color: white; padding: 15px;">
        <h2 style="margin: 0px; font-family: Arial;">Liste des récupérations restantes</h2>
      </div>
      <div class="email-body" style="padding: 20px; font-size: 16px; font-family: Arial;">
        <p>Bonjour Admin,</p>
        <p>Voici les commandes de location prévues:</p>

        <table>
          <thead>
            <tr>
              <th>Order #</th>
              <th>Customer</th>
              <th>Phone</th>
              <th>Address</th>
              <th>Time</th>
              <th>Items</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($data as $order): ?>
              <tr>
                <td><?php echo $order['order_number']; ?></td>
                <td><?php echo $order['customer_name']; ?></td>
                <td><?php echo $order['phone']; ?></td>
                <td><?php echo $order['address']; ?></td>
                <td><?php echo $order['time']; ?></td>
                <td>
                  <?php foreach ($order['items'] as $item): ?>
                    <?php echo $item['name'] . ' x ' . $item['qty']; ?><br />
                  <?php endforeach; ?>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <p style="margin-top: 20px;">Veuillez vous assurer que l'équipe de récupération est informée et programmée en conséquence.</p>
        <p class="text-sm text-gray-500 mt-3">Il s'agit d'un résumé automatisé de votre système de location.</p>
      </div>
    </div>
  </div>
</body>
</html>
