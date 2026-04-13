---
title: "HTMLFencedFrameElement: config property"
short-title: config
slug: Web/API/HTMLFencedFrameElement/config
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLFencedFrameElement.config
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Thuộc tính **`config`** của {{domxref("HTMLFencedFrameElement")}} chứa một đối tượng {{domxref("FencedFrameConfig")}}, đại diện cho điều hướng của {{htmlelement("fencedframe")}}, tức là nội dung nào sẽ được hiển thị trong đó. `FencedFrameConfig` được trả về từ một nguồn như [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience).

## Giá trị

Giá trị của `config` ban đầu là `null`.

Khi giá trị được đặt thành một đối tượng {{domxref("FencedFrameConfig")}}, các thuộc tính nội bộ của `FencedFrameConfig` (ví dụ `mappedURL`) xác định những gì được tải bên trong `<fencedframe>` liên kết. Ngoài ra:

- Loại điều hướng sẽ là `"replace"` (xem {{domxref("NavigateEvent.navigationType")}}), nghĩa là mục lịch sử hiện tại được thay thế bằng mục mới, thay vì thêm mục lịch sử mới.
- {{httpheader("Referrer-Policy")}} của điều hướng được đặt thành `"no-referrer"`.

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
