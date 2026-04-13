---
title: Presentation
slug: Web/API/Presentation
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Presentation
---

{{SeeCompatTable}}{{securecontext_header}}{{APIRef("Presentation API")}}

**`Presentation`** có thể được định nghĩa là hai tác nhân người dùng có thể có trong ngữ cảnh: _Tác nhân người dùng kiểm soát_ và _Tác nhân người dùng nhận_.

Trong ngữ cảnh duyệt web kiểm soát, giao diện `Presentation` cung cấp cơ chế để ghi đè hành vi mặc định của trình duyệt khi khởi chạy trình bày ra màn hình ngoài. Trong ngữ cảnh duyệt web nhận, giao diện `Presentation` cung cấp quyền truy cập vào các kết nối trình bày có sẵn.

## Thuộc tính phiên bản

- {{DOMxRef("Presentation.defaultRequest")}} {{Experimental_Inline}}
  - : Trong một [tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent), thuộc tính `defaultRequest` _PHẢI_ trả về [yêu cầu trình bày mặc định](https://www.w3.org/TR/presentation-api/#dfn-default-presentation-request) nếu có, `null` nếu không. Trong một [ngữ cảnh duyệt web nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-browsing-context), nó _PHẢI_ trả về `null`.
- {{DOMxRef("Presentation.receiver")}} {{Experimental_Inline}}
  - : Trong một [tác nhân người dùng nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-user-agent), thuộc tính `receiver` _PHẢI_ trả về phiên bản {{DOMxRef("PresentationReceiver")}} được liên kết với [ngữ cảnh duyệt web nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-browsing-context) và được tạo bởi [tác nhân người dùng nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-user-agent) khi [ngữ cảnh duyệt web nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-browsing-context) được tạo.

## Phương thức phiên bản

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
