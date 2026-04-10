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

Thuộc tính chỉ đọc **`locale`** của giao diện {{domxref("CompositionEvent")}} trả về ngôn ngữ của phương thức nhập hiện tại (ví dụ, ngôn ngữ bố cục bàn phím nếu quá trình soạn thảo liên quan đến một {{glossary("Input method editor")}}).

> [!WARNING]
> Ngay cả đối với các trình duyệt hỗ trợ nó, đừng tin tưởng giá trị chứa trong thuộc tính này.
> Ngay cả khi về mặt kỹ thuật nó có thể truy cập được, cách thiết lập nó khi tạo một {{domxref("CompositionEvent")}} không được đảm bảo là nhất quán.

## Giá trị

Một chuỗi biểu diễn ngôn ngữ của phương thức nhập hiện tại.

## Đặc điểm kỹ thuật

Thuộc tính này đã có trong các phiên bản đầu của các đặc tả khác nhau. Hiện tại nó chỉ được giữ lại cho mục đích tương thích, và cách đặt giá trị của nó khi tạo một {{domxref("CompositionEvent")}} là [không được xác định rõ](https://github.com/w3c/uievents/issues/48).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}
