<?php

namespace App\Mail\Orders;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use PDF;

class OrderSummary extends Mailable
{
    use Queueable, SerializesModels;
    public $data;

    /**
     * Create a new message instance.
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $pdf = PDF::loadView('emails.orders.invoice', $this->data);

        return $this->view('emails.orders.order-summary')
                    ->subject('Your Order Confirmation – Order# '.$this->data['order_id'])
                    ->with(['data' => $this->data])
                    ->attachData($pdf->output(), 'invoice-'.$this->data['order_id'].'.pdf', [
                        'mime' => 'application/pdf',
                    ]);
    }
}
