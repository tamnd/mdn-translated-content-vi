---
title: "PerformanceObserver: thuộc tính tĩnh supportedEntryTypes"
short-title: supportedEntryTypes
slug: Web/API/PerformanceObserver/supportedEntryTypes_static
page-type: web-api-static-property
browser-compat: api.PerformanceObserver.supportedEntryTypes_static
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc tĩnh **`supportedEntryTypes`** của giao diện {{domxref("PerformanceObserver")}} trả về một mảng các giá trị {{domxref("PerformanceEntry.entryType","entryType")}} mà user agent hỗ trợ.

Vì danh sách các entry được hỗ trợ thay đổi tùy theo trình duyệt và đang không ngừng phát triển, thuộc tính này cho phép nhà phát triển web kiểm tra entry nào đang khả dụng.

## Giá trị

Một mảng các giá trị {{domxref("PerformanceEntry.entryType")}}.

## Ví dụ

### Dùng console để kiểm tra các kiểu được hỗ trợ

Để tìm hiểu xem trình duyệt hỗ trợ những giá trị {{domxref("PerformanceEntry.entryType","entryType")}} nào, hãy nhập <kbd>PerformanceObserver.supportedEntryTypes</kbd> vào console. Kết quả sẽ trả về một mảng các giá trị được hỗ trợ.

```js
PerformanceObserver.supportedEntryTypes;

// trả về ["element", "event", "first-input", "largest-contentful-paint", "layout-shift", "long-animation-frame", "longtask", "mark", "measure", "navigation", "paint", "resource", "visibility-state"] trong main thread ở Chrome 129
// trả về ["mark", "measure", "resource"] trong worker thread ở Chrome 129
```

### Kiểm tra các kiểu không được hỗ trợ

Hàm sau kiểm tra khả năng hỗ trợ của một mảng các kiểu entry có thể có. Các kiểu không được hỗ trợ sẽ được ghi vào console, tuy nhiên thông tin này có thể được ghi vào analytics phía client để cho biết rằng kiểu cụ thể đó không thể được quan sát.

```js
function detectSupport(entryTypes) {
  for (const entryType of entryTypes) {
    if (!PerformanceObserver.supportedEntryTypes.includes(entryType)) {
      console.log(entryType);
    }
  }
}

detectSupport(["resource", "mark", "first-input", "largest-contentful-paint"]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
