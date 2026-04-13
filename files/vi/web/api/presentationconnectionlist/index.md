---
title: PresentationConnectionList
slug: Web/API/PresentationConnectionList
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PresentationConnectionList
---

{{securecontext_header}}{{SeeCompatTable}}{{APIRef("Presentation API")}}

`PresentationConnectionList` là tập hợp các kết nối trình bày đến (incoming presentation connections).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref('PresentationConnectionList.connections')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tập hợp các {{DOMxRef("PresentationConnection")}} chưa bị kết thúc trong [tập hợp bộ điều khiển trình bày](https://www.w3.org/TR/presentation-api/#dfn-set-of-presentation-controllers).

## Sự kiện

- {{domxref('PresentationConnectionList/connectionavailable_event', "connectionavailable")}} {{Experimental_Inline}}
  - : Được kích hoạt mỗi khi có một [kết nối trình bày](https://www.w3.org/TR/presentation-api/#dfn-presentation-connection) mới được thiết lập.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
