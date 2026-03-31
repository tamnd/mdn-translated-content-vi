---
title: 402 Payment Required
slug: Web/HTTP/Reference/Status/402
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.402
sidebar: http
---

Mã trạng thái HTTP **`402 Payment Required`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) là mã trạng thái **không chuẩn** được dành để sử dụng trong tương lai.

Mã trạng thái này được tạo ra để hỗ trợ các hệ thống tiền mặt kỹ thuật số hoặc thanh toán (vi thanh toán), cho biết nội dung được yêu cầu chưa khả dụng cho đến khi client thực hiện thanh toán.
Không có quy ước sử dụng chuẩn nào tồn tại và các hệ thống khác nhau sử dụng nó trong các ngữ cảnh khác nhau.

## Trạng thái

```http
402 Payment Required
```

## Ví dụ

### Lỗi API thanh toán

Một số API thanh toán sử dụng phản hồi 402 như một phản hồi chung cho mọi yêu cầu thanh toán thất bại.
Ví dụ sau thử gọi đến một API thanh toán sử dụng yêu cầu POST để khởi tạo một giao dịch:

```http
POST /merchant/transfers/payment HTTP/1.1
Host: payments.example.com
Content-Type: application/json
Content-Length: 402

{
  "payment_transfer": {
    "reference": "PAYMENT123456",
    "amount": "1337",
    "currency": "EUR",
    "sender_account_uri": "pan:5299920000000149;exp=2020-08;cvc=123",
    "sender": {
      "first_name": "Amelia",
      "middle_name": "Rosenburg",
      "email": "test123@sender.example.com"
    },
    "recipient": {
      "first_name": "Tyrone",
      "middle_name": "Johnston",
      "email": "test123@example.com",
      "merchant_id": "123"
    },
    "authentication_value": "ucaf:jJJLtQa+Iws8AREAEbjsA1MAAAA",
  }
}
```

Máy chủ phản hồi yêu cầu với 402 nếu có vấn đề với giao dịch, trong trường hợp này thẻ đã hết hạn:

```http
HTTP/1.1 402 Payment Required
Date: Tue, 02 Jul 2024 12:56:49 GMT
Content-Type: application/json
Content-Length: 175

{
  "error": {
    "code": "expired_card",
    "doc_url": "https://example.com/error-codes#expired-card",
    "message": "The card has expired. Verify expiration or use a different card.",
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Ghi chú tương thích

Mã trạng thái này được _dành riêng_ nhưng chưa được định nghĩa.
Các triển khai thực tế khác nhau về định dạng và nội dung của phản hồi.
Không có trình duyệt nào hỗ trợ mã 402, và lỗi sẽ hiển thị như một mã trạng thái `4xx` thông thường.

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
