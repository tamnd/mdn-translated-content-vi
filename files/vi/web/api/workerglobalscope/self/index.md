---
title: "WorkerGlobalScope: thuộc tính self"
short-title: self
slug: Web/API/WorkerGlobalScope/self
page-type: web-api-instance-property
browser-compat: api.WorkerGlobalScope.self
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("worker")}}

Thuộc tính chỉ đọc **`self`** của giao diện {{domxref("WorkerGlobalScope")}} trả về một tham chiếu đến chính `WorkerGlobalScope`. Phần lớn thời gian đây là một phạm vi cụ thể như {{domxref("DedicatedWorkerGlobalScope")}}, {{domxref("SharedWorkerGlobalScope")}}, hoặc {{domxref("ServiceWorkerGlobalScope")}}.

## Giá trị

Một đối tượng phạm vi global (khác nhau tùy thuộc vào loại worker bạn đang xử lý, như đã chỉ ra ở trên).

## Ví dụ

Nếu bạn gọi

```js
console.log(self);
```

bên trong một worker, bạn sẽ nhận được một phạm vi global worker cùng loại với đối tượng worker đó được ghi ra console — tương tự như sau:

```plain
DedicatedWorkerGlobalScope {
undefined: undefined, Infinity: Infinity, Math: MathConstructor, NaN: NaN, Intl: Object…}
    Infinity: Infinity
    Array: function Array() { [native code] }
      arguments: null
      caller: null
      isArray: function isArray() { [native code] }
      length: 1
      name: "Array"
      observe: function observe() { [native code] }
      prototype: Array[0]
      unobserve: function unobserve() { [native code] }
      __proto__: function Empty() {}
      <function scope>
    ArrayBuffer: function ArrayBuffer() { [native code] }
    Blob: function Blob() { [native code] }
    Boolean: function Boolean() { [native code] }
    DataView: function DataView() { [native code] }
    Date: function Date() { [native code] }
    DedicatedWorkerGlobalScope: function DedicatedWorkerGlobalScope() { [native code] }
    Error: function Error() { [native code] }
// v.v.
```

Điều này cung cấp danh sách đầy đủ các đối tượng khả dụng cho phạm vi worker đó, vì vậy đây là một kiểm tra khá hữu ích nếu bạn muốn xem thứ gì đó có khả dụng cho worker của bạn hay không. Chúng tôi cũng duy trì danh sách [Các hàm và lớp khả dụng cho Web Workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

{{domxref("WorkerGlobalScope")}}
