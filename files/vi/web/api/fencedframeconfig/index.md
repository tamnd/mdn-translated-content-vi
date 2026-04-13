---
title: FencedFrameConfig
slug: Web/API/FencedFrameConfig
page-type: web-api-interface
status:
  - experimental
browser-compat: api.FencedFrameConfig
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Giao diện **`FencedFrameConfig`** đại diện cho điều hướng của {{htmlelement("fencedframe")}}, tức là nội dung nào sẽ được hiển thị trong đó.

Các đối tượng `FencedFrameConfig` không thể được xây dựng thủ công qua JavaScript. Chúng được trả về từ nguồn như [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience) và được đặt làm giá trị của {{domxref("HTMLFencedFrameElement.config")}}.

Đối tượng `FencedFrameConfig` có một phương thức được hiển thị, nhưng nó cũng ánh xạ đến thông tin cấu hình nội bộ chứa các thuộc tính mờ không thể truy cập từ JavaScript. Điều này bao gồm thông tin như nguồn nội dung được tải và các nhóm quan tâm cho mục đích quảng cáo. Đây là chìa khóa cho cách fenced frame giúp triển khai các trường hợp sử dụng chính trong khi tôn trọng quyền riêng tư người dùng.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("FencedFrameConfig.setSharedStorageContext", "setSharedStorageContext()")}} {{experimental_inline}}
  - : Truyền dữ liệu từ tài liệu nhúng vào bộ nhớ chia sẻ của `<fencedframe>`.

## Ví dụ

### Sử dụng cơ bản

Để đặt nội dung nào sẽ được hiển thị trong `<fencedframe>`, API sử dụng (như [Protected Audience](https://privacysandbox.google.com/private-advertising/protected-audience) hoặc [Shared Storage](https://privacysandbox.google.com/private-advertising/shared-storage)) tạo ra một đối tượng `FencedFrameConfig`, sau đó được đặt làm giá trị của thuộc tính `config` của `<fencedframe>`.

Ví dụ sau lấy `FencedFrameConfig` từ cuộc đấu giá quảng cáo của Protected Audience API, sau đó được sử dụng để hiển thị quảng cáo thắng trong `<fencedframe>`:

```js
const frameConfig = await navigator.runAdAuction({
  // … auction configuration
  resolveToConfig: true,
});

const frame = document.createElement("fencedframe");
frame.config = frameConfig;
```

> [!NOTE]
> `resolveToConfig: true` phải được truyền vào lệnh gọi `runAdAuction()` để lấy đối tượng `FencedFrameConfig`. Nếu không được đặt, {{jsxref("Promise")}} kết quả sẽ giải quyết thành URN chỉ có thể được sử dụng trong {{htmlelement("iframe")}}.

### Truyền dữ liệu ngữ cảnh qua `setSharedStorageContext()`

Bạn có thể sử dụng [Private Aggregation API](https://privacysandbox.google.com/private-advertising/private-aggregation) để tạo báo cáo kết hợp dữ liệu cấp sự kiện bên trong fenced frame với dữ liệu ngữ cảnh từ tài liệu nhúng. `setSharedStorageContext()` có thể được sử dụng để truyền dữ liệu ngữ cảnh từ trình nhúng đến các worklet bộ nhớ chia sẻ được khởi tạo bởi [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience).

Trong ví dụ sau, chúng tôi lưu trữ dữ liệu từ cả trang nhúng và fenced frame trong [bộ nhớ chia sẻ](https://privacysandbox.google.com/private-advertising/shared-storage).

Trong trang nhúng, chúng tôi sẽ đặt ID sự kiện mô phỏng làm ngữ cảnh bộ nhớ chia sẻ bằng `setSharedStorageContext()`:

```js
const frameConfig = await navigator.runAdAuction({ resolveToConfig: true });

// Dữ liệu từ trình nhúng mà bạn muốn truyền đến worklet bộ nhớ chia sẻ
frameConfig.setSharedStorageContext("some-event-id");

const frame = document.createElement("fencedframe");
frame.config = frameConfig;
```

Bên trong fenced frame, chúng tôi thêm module worklet với {{domxref("Worklet.addModule","window.sharedStorage.worklet.addModule()")}}, sau đó gửi dữ liệu cấp sự kiện vào worklet bộ nhớ chia sẻ bằng {{domxref("WindowSharedStorage.run","window.sharedStorage.run()")}}:

```js
const frameData = {
  // Dữ liệu chỉ có trong fenced frame
};

await window.sharedStorage.worklet.addModule("reporting-worklet.js");

await window.sharedStorage.run("send-report", {
  data: {
    frameData,
  },
});
```

Trong worklet `reporting-worklet.js`, chúng tôi đọc ID sự kiện của tài liệu nhúng từ `sharedStorage.context` và dữ liệu cấp sự kiện của frame từ đối tượng dữ liệu, sau đó báo cáo chúng qua [Private Aggregation](https://privacysandbox.google.com/private-advertising/private-aggregation):

```js
class ReportingOperation {
  convertEventIdToBucket(eventId) {
    // …
  }
  convertEventPayloadToValue(info) {
    // …
  }

  async run(data) {
    // Dữ liệu từ trình nhúng
    const eventId = sharedStorage.context;

    // Dữ liệu từ fenced frame
    const eventPayload = data.frameData;

    privateAggregation.sendHistogramReport({
      bucket: convertEventIdToBucket(eventId),
      value: convertEventPayloadToValue(eventPayload),
    });
  }
}

register("send-report", ReportingOperation);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
