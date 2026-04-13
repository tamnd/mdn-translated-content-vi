---
title: HTMLBodyElement
slug: Web/API/HTMLBodyElement
page-type: web-api-interface
browser-compat: api.HTMLBodyElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLBodyElement`** cung cấp các thuộc tính đặc biệt (ngoài những thuộc tính kế thừa từ giao diện {{ domxref("HTMLElement") }} thông thường) để thao tác các phần tử {{HtmlElement("body")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha là {{domxref("HTMLElement")}}._

- {{domxref("HTMLBodyElement.aLink")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho màu của các siêu liên kết đang hoạt động.
- {{domxref("HTMLBodyElement.background")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho mô tả vị trí của tài nguyên hình nền.
- {{domxref("HTMLBodyElement.bgColor")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho màu nền cho tài liệu.
- {{domxref("HTMLBodyElement.link")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho màu của các liên kết chưa được truy cập.
- {{domxref("HTMLBodyElement.text")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho màu nền trước của văn bản.
- {{domxref("HTMLBodyElement.vLink")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho màu của các liên kết đã truy cập.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ giao diện cha là {{domxref("HTMLElement")}}._

## Trình xử lý sự kiện

Các sự kiện {{domxref("HTMLElement")}} được kế thừa.

Các thuộc tính trình xử lý sự kiện `onXYZ` của {{domxref("Window")}} sau đây cũng có sẵn như các bí danh nhắm đến đối tượng `window`. Tuy nhiên, nên lắng nghe chúng trực tiếp trên đối tượng `window` thay vì trên `HTMLBodyElement`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("body") }}
