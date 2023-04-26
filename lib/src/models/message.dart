enum Message {
  prepareOrder('prepare_order'),

  deliveryOrder('delivery_order'),

  reviewOrder('review_order');

  const Message(this.value);

  final String value;
}
