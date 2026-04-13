---
title: "FencedFrameConfig: setSharedStorageContext() method"
short-title: setSharedStorageContext()
slug: Web/API/FencedFrameConfig/setSharedStorageContext
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FencedFrameConfig.setSharedStorageContext
---

{{APIRef("Fenced Frame API")}}{{SeeCompatTable}}

Phương thức **`setSharedStorageContext()`** của giao diện {{domxref("FencedFrameConfig")}} truyền dữ liệu ngữ cảnh từ tài liệu nhúng vào [bộ nhớ chia sẻ](https://privacysandbox.google.com/private-advertising/shared-storage) của `<fencedframe>`.

## Cú pháp

```js-nolint
setSharedStorageContext(context)
```

### Tham số

- `context`
  - : Một chuỗi đại diện cho dữ liệu ngữ cảnh cần truyền vào bộ nhớ chia sẻ. Sau khi được đặt, nó sẽ được lưu trữ trong cấu hình nội bộ của đối tượng {{domxref("FencedFrameConfig")}}.

### Giá trị trả về

Không có (`Undefined`).

## Ví dụ

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

Trong worklet `reporting-worklet.js`, chúng tôi đọc ID sự kiện của tài liệu nhúng từ `sharedStorage.context` và dữ liệu cấp sự kiện của frame từ đối tượng dữ liệu, sau đó báo cáo chúng qua Private Aggregation:

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
