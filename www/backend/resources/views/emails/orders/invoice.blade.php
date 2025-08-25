<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Facture - Commande {{ $order_id }}</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      color: #1f2937;
      font-size: 14px;
    }
    .header, .summary, .section {
      margin-bottom: 30px;
    }
    .flex {
      display: flex;
      justify-content: space-between;
      gap: 30px;
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 12px 24px;
    }
    .table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    .table th, .table td {
      border: 1px solid #ddd;
      padding: 10px;
    }
    .table th {
      background-color: #f3f4f6;
      color: #374151;
      text-align: left;
    }
    .total-table td {
      padding: 8px;
    }
    .text-right {
      text-align: right;
    }
    .text-bold {
      font-weight: bold;
    }
    .text-blue {
      color: #2563eb;
    }
    .text-green {
      color: #059669;
    }
    .text-yellow {
      color: #ca8a04;
    }
    .border-top {
      border-top: 1px dashed #ccc;
    }
    .img {
      height: 50px;
      width: 50px;
      object-fit: cover;
    }
  </style>
</head>
<body>

  <!-- Header Section -->
  <table style="width: 100%; margin-bottom: 30px;">
    <tr>
        <!-- Logo -->
        <td style="width: 150px; vertical-align: top;">
        <img src="{{ public_path('logo.png') }}" alt="Logo" style="width: 100px;">
        </td>

        <!-- Order Info -->
        <td style="vertical-align: top;">
        <table style="font-size: 14px; color: #1f2937; width: 100%;">
            <tr>
            <td><strong>Commande:</strong></td>
            <td>{{ $order_id }}</td>
            </tr>
            <tr>
            <td><strong>Date:</strong></td>
            <td>{{ $date }}</td>
            </tr>
            <tr>
            <td><strong>Statut:</strong></td>
            <td><span style="color: #ca8a04;">{{ $status }}</span></td>
            </tr>
            <tr>
            <td><strong>Paiement:</strong></td>
            <td><span style="color: #059669;">{{ $payment_status }}</span></td>
            </tr>
            <tr>
            <td><strong>Type:</strong></td>
            <td>{{ $type }}</td>
            </tr>
            @if(!empty($rental_start_date))
            <tr>
            <td><strong>Période:</strong></td>
            <td>{{ \Carbon\Carbon::parse($rental_start_date)->format('d/m/Y') }} au {{ \Carbon\Carbon::parse($rental_end_date)->format('d/m/Y') }}</td>
            </tr>
            @endif
        </table>
        </td>
    </tr>
    </table>

  <!-- Customer Info -->
  <div class="section" style="border: 1px solid #e5e7eb; padding: 16px; background: #f9fafb;">
    <p><strong>Nom:</strong> {{ $customer_name }}</p>
    <p><strong>E-mail:</strong> {{ $email }}</p>
    <p><strong>Téléphone:</strong> {{ $phone }}</p>
    <p><strong>Adresse:</strong> {{ $shipping_address }}</p>
  </div>

  <!-- Items Table -->
  <div class="section">
    <h3 style="margin-bottom: 10px;">Produits</h3>
    <table class="table">
      <thead>
        <tr>
          <th>Image</th>
          <th>Nom</th>
          <th class="text-right">Qté</th>
          <th class="text-right">Rabais</th>
          <th class="text-right">Total</th>
        </tr>
      </thead>
      <tbody>
        @foreach ($items as $item)
        <tr>
          <td class="text-center">
            @if(!empty($item['image']))
              <img src="{{ public_path('uploads/products/' . basename($item['image'])) }}" style="width: 50px; height: 50px; object-fit: cover;" alt="">
            @else
              N/A
            @endif
          </td>
          <td>{{ $item['name'] }}</td>
          <td class="text-right">{{ $item['qty'] }}</td>
          <td class="text-right">{{ !empty($item['discount']) ? number_format($item['discount'], 2).' €' : '-' }}</td>
          <td class="text-right">{{ number_format(($item['qty'] * $item['price']) - ($item['discount'] ?? 0), 2) }} €</td>
        </tr>
        @endforeach
      </tbody>
    </table>
  </div>

  <!-- Summary -->
  <div class="summary">
    <table class="total-table" style="float: right; width: 300px;">
      <tr>
        <td>Sous-total:</td>
        <td class="text-right">{{ number_format($subtotal, 2) }} €</td>
      </tr>
      <tr>
        <td>Expédition:</td>
        <td class="text-right">{{ number_format($shipping, 2) }} €</td>
      </tr>
      <tr>
        <td class="text-green text-bold">Rabais:</td>
        <td class="text-right text-green text-bold">- {{ number_format($discount, 2) }} €</td>
      </tr>
      <tr class="border-top text-bold text-blue">
        <td>Total:</td>
        <td class="text-right">{{ number_format($total, 2) }} €</td>
      </tr>
    </table>
  </div>

</body>
</html>
