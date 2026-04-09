---
title: "CompositionEvent: thuộc tính locale"
short-title: locale
slug: Web/API/CompositionEvent/locale
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.CompositionEvent.locale
---

{{deprecated_header}}{{APIRef("UI Events")}}{{Non-standard_header}}

Thuộc tính chỉ đọc **`locale`** của giao diện {{domxref("CompositionEvent")}} trả về locale của phương thức nhập hiện tại (ví dụ: locale bố cục bàn phím nếu composition gắn với một {{glossary("Input method editor")}}).

> [!WARNING]
> Ngay cả với các trình duyệt hỗ trợ thuộc tính này, đừng tin cậy giá trị mà nó chứa.
> Dù về mặt kỹ thuật vẫn có thể truy cập được, cách đặt giá trị này khi tạo một {{domxref("CompositionEvent")}} không được đảm bảo là nhất quán.

## Giá trị

Một chuỗi biểu diễn locale của phương thức nhập hiện tại.

## Thông số kỹ thuật

Thuộc tính này từng xuất hiện trong các phiên bản đầu của nhiều đặc tả khác nhau. Hiện nay nó chỉ còn được giữ lại vì mục đích tương thích, và cách đặt giá trị của nó khi tạo một {{domxref("CompositionEvent")}} [không được định nghĩa rõ ràng](https://github.com/w3c/uievents/issues/48).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}
