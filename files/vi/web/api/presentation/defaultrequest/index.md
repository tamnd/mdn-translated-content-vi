---
title: "Presentation: thuộc tính defaultRequest"
short-title: defaultRequest
slug: Web/API/Presentation/defaultRequest
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Presentation.defaultRequest
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Trong một [tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent), thuộc tính **`defaultRequest`** _PHẢI_ trả về [yêu cầu trình bày mặc định](https://www.w3.org/TR/presentation-api/#dfn-default-presentation-request) nếu có, nếu không là `null`. Trong một [ngữ cảnh duyệt web nhận](https://www.w3.org/TR/presentation-api/#dfn-receiving-browsing-context), nó _PHẢI_ trả về `null`.

Nếu được đặt bởi [bộ điều khiển](https://www.w3.org/TR/presentation-api/#dfn-controller), giá trị của thuộc tính `defaultRequest` _NÊN_ được sử dụng bởi [tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) làm _yêu cầu trình bày mặc định_ cho [ngữ cảnh duyệt web kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-browsing-context) đó.

> [!NOTE]
> Một số [tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) có thể cho phép người dùng khởi tạo [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) mặc định và chọn [màn hình trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-display) với cùng một cử chỉ người dùng.

> [!NOTE]
> Nếu một [tác nhân người dùng kiểm soát](https://www.w3.org/TR/presentation-api/#dfn-controlling-user-agent) không hỗ trợ khởi tạo [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) từ chrome trình duyệt, việc đặt `defaultRequest` sẽ không có hiệu lực.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
