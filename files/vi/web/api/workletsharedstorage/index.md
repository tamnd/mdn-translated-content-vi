---
title: WorkletSharedStorage
slug: Web/API/WorkletSharedStorage
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.WorkletSharedStorage
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`WorkletSharedStorage`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho bộ nhớ chia sẻ cho một nguồn gốc cụ thể trong bối cảnh worklet.

`WorkletSharedStorage` được truy cập qua {{domxref("SharedStorageWorkletGlobalScope.sharedStorage")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("WorkletSharedStorage.context", "context")}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Chứa dữ liệu ngữ cảnh được truyền vào worklet bộ nhớ chia sẻ từ bối cảnh duyệt web liên kết qua phương thức {{domxref("FencedFrameConfig.setSharedStorageContext()")}}.

## Phương thức phiên bản

_`WorkletSharedStorage` kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SharedStorage")}}._

- {{domxref("WorkletSharedStorage.get", "get()")}} {{Deprecated_Inline}}
  - : Lấy một giá trị từ bộ nhớ chia sẻ.
- {{domxref("WorkletSharedStorage.length", "length()")}} {{Deprecated_Inline}}
  - : Trả về số lượng mục hiện đang được lưu trong bộ nhớ chia sẻ cho nguồn gốc hiện tại.
- {{domxref("WorkletSharedStorage.remainingBudget", "remainingBudget()")}} {{Deprecated_Inline}}
  - : Trả về ngân sách điều hướng còn lại cho nguồn gốc hiện tại.

`WorkletSharedStorage` cũng bao gồm các phương thức sau vì nó có [async iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator) được định nghĩa trên nó:

- {{domxref("WorkletSharedStorage.entries", "entries()")}} {{Deprecated_Inline}}
  - : Trả về một async iterator mới cho các cặp key-value của các thuộc tính có thể liệt kê của một phiên bản đối tượng `WorkletSharedStorage`.
- {{domxref("WorkletSharedStorage.keys", "keys()")}} {{Deprecated_Inline}}
  - : Trả về một async iterator mới chứa các khóa cho mỗi mục trong một phiên bản đối tượng `WorkletSharedStorage`.
- `WorkletSharedStorage[Symbol.asyncIterator]()` {{Deprecated_Inline}}
  - : Trả về hàm {{domxref("WorkletSharedStorage.entries", "entries()")}} theo mặc định.

## Ví dụ

### Truyền dữ liệu ngữ cảnh qua `setSharedStorageContext()`

Bạn có thể sử dụng [Private Aggregation API](https://privacysandbox.google.com/private-advertising/private-aggregation) để tạo báo cáo kết hợp dữ liệu cấp sự kiện bên trong các fenced frame với dữ liệu ngữ cảnh từ tài liệu nhúng. `setSharedStorageContext()` có thể được dùng để truyền dữ liệu ngữ cảnh từ phần nhúng đến các worklet bộ nhớ chia sẻ được khởi tạo bởi [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience).

Trong ví dụ này, chúng ta lưu trữ dữ liệu từ cả trang nhúng và fenced frame bằng cách dùng [shared storage](https://privacysandbox.google.com/private-advertising/shared-storage).

Trên trang nhúng, chúng ta đặt ID sự kiện giả làm ngữ cảnh bộ nhớ chia sẻ bằng `setSharedStorageContext()`:

```js
const frameConfig = await navigator.runAdAuction({ resolveToConfig: true });

// Data from the embedder that you want to pass to the shared storage worklet
frameConfig.setSharedStorageContext("some-event-id");

const frame = document.createElement("fencedframe");
frame.config = frameConfig;
```

Trong fenced frame, sau khi thêm module worklet với {{domxref("Worklet.addModule","window.sharedStorage.worklet.addModule()")}}, chúng ta gửi dữ liệu cấp sự kiện vào module worklet bộ nhớ chia sẻ bằng {{domxref("WindowSharedStorage.run","window.sharedStorage.run()")}} (điều này không liên quan đến dữ liệu ngữ cảnh từ tài liệu nhúng):

```js
const frameData = {
  // Data available only inside the fenced frame
};

await window.sharedStorage.worklet.addModule("reporting-worklet.js");

await window.sharedStorage.run("send-report", {
  data: {
    frameData,
  },
});
```

Trong worklet `reporting-worklet.js`, chúng ta đọc ID sự kiện của tài liệu nhúng từ `sharedStorage.context` và dữ liệu cấp sự kiện của frame từ đối tượng data. Sau đó chúng ta báo cáo chúng qua Private Aggregation:

```js
class ReportingOperation {
  convertEventIdToBucket(eventId) {
    // …
  }
  convertEventPayloadToValue(info) {
    // …
  }

  async run(data) {
    // Data from the embedder
    const eventId = sharedStorage.context;

    // Data from the fenced frame
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

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
