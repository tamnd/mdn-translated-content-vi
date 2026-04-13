---
title: "PaymentAddress: thuộc tính postalCode"
short-title: postalCode
slug: Web/API/PaymentAddress/postalCode
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress.postalCode
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`postalCode`** của giao diện {{domxref('PaymentAddress')}} trả về một chuỗi chứa mã được sử dụng bởi một khu vực pháp lý để định tuyến thư, ví dụ, [mã ZIP](https://en.wikipedia.org/wiki/ZIP_Code) ở Hoa Kỳ hoặc [Postal Index Number](https://en.wikipedia.org/wiki/Postal_Index_Number) (mã PIN) ở Ấn Độ.

## Giá trị

Một chuỗi chứa phần mã bưu chính của địa chỉ. Mã bưu chính là một chuỗi (dạng số hoặc chữ số) được dịch vụ bưu chính sử dụng để tối ưu hóa định tuyến và giao hàng thư.

Các quốc gia khác nhau sử dụng các thuật ngữ khác nhau cho mã này. Ở hầu hết các nơi trên thế giới, nó được gọi là "mã bưu chính" hay "mã bưu điện." Ở Hoa Kỳ, mã ZIP được sử dụng. Ấn Độ sử dụng mã PIN.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Universal Postal Union: [Universal Post\*Code® Database](https://www.upu.int/en/Postal-Solutions/Programmes-Services/Addressing-Solutions)
