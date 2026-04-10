---
title: "TextDecoder: fatal property"
short-title: fatal
slug: Web/API/TextDecoder/fatal
page-type: web-api-instance-property
browser-compat: api.TextDecoder.fatal
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`fatal`** của giao diện {{domxref("TextDecoder")}} là một {{jsxref('Boolean')}} cho biết chế độ lỗi có phải là fatal hay không.

Nếu thuộc tính là `true`, bộ giải mã sẽ ném ra {{jsxref("TypeError")}} nếu gặp dữ liệu lỗi trong khi giải mã.
Nếu là `false`, bộ giải mã sẽ thay dữ liệu không hợp lệ bằng ký tự thay thế `U+FFFD` (�).
Giá trị của thuộc tính được đặt trong đối số [`fatal`](/en-US/docs/Web/API/TextDecoder/TextDecoder#fatal) của hàm tạo bộ giải mã.

## Giá trị

Một giá trị boolean sẽ là `true` nếu chế độ lỗi được đặt thành `fatal`.
Ngược lại, nó sẽ là `false`, cho biết chế độ lỗi là `replacement`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
