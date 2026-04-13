---
title: HTMLFencedFrameElement
slug: Web/API/HTMLFencedFrameElement
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HTMLFencedFrameElement
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Giao diện **`HTMLFencedFrameElement`** đại diện cho phần tử {{htmlelement("fencedframe")}} trong JavaScript và cung cấp các thuộc tính cấu hình.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLFencedFrameElement.allow")}} {{experimental_inline}}
  - : Lấy và đặt giá trị của thuộc tính `allow` của `<fencedframe>` tương ứng, đại diện cho [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được áp dụng cho nội dung khi lần đầu nhúng vào.
- {{domxref("HTMLFencedFrameElement.config")}} {{experimental_inline}}
  - : Một đối tượng {{domxref("FencedFrameConfig")}}, đại diện cho điều hướng của {{htmlelement("fencedframe")}}, tức là nội dung nào sẽ được hiển thị trong đó. `FencedFrameConfig` được trả về từ một nguồn như [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience).
- {{domxref("HTMLFencedFrameElement.height")}} {{experimental_inline}}
  - : Lấy và đặt giá trị của thuộc tính `height` của `<fencedframe>` tương ứng, chỉ định chiều cao của phần tử.
- {{domxref("HTMLFencedFrameElement.width")}} {{experimental_inline}}
  - : Lấy và đặt giá trị của thuộc tính `width` của `<fencedframe>` tương ứng, chỉ định chiều rộng của phần tử.

## Ví dụ

Để đặt nội dung nào sẽ hiển thị trong `<fencedframe>`, một API sử dụng (như [Protected Audience](https://privacysandbox.google.com/private-advertising/protected-audience) hoặc [Shared Storage](https://privacysandbox.google.com/private-advertising/shared-storage)) tạo ra đối tượng {{domxref("FencedFrameConfig")}}, sau đó được đặt làm giá trị của thuộc tính `config` của `<fencedframe>`.

Ví dụ sau lấy `FencedFrameConfig` từ phiên đấu giá quảng cáo của Protected Audience API, sau đó được sử dụng để hiển thị quảng cáo thắng cuộc trong `<fencedframe>`:

```js
const frameConfig = await navigator.runAdAuction({
  // … auction configuration
  resolveToConfig: true,
});

const frame = document.createElement("fencedframe");
frame.config = frameConfig;
```

> [!NOTE]
> `resolveToConfig: true` phải được truyền vào lệnh gọi `runAdAuction()` để nhận đối tượng `FencedFrameConfig`. Nếu không đặt, {{jsxref("Promise")}} kết quả sẽ phân giải thành URN chỉ có thể được sử dụng trong {{htmlelement("iframe")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
