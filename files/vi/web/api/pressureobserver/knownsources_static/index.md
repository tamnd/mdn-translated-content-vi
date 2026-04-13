---
title: "PressureObserver: thuộc tính tĩnh knownSources"
short-title: knownSources
slug: Web/API/PressureObserver/knownSources_static
page-type: web-api-static-property
status:
  - experimental
browser-compat: api.PressureObserver.knownSources_static
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Thuộc tính tĩnh chỉ đọc **`knownSources`** của giao diện {{domxref("PressureObserver")}} trả về một mảng các giá trị {{domxref("PressureRecord.source","source")}} được user agent hỗ trợ, theo thứ tự bảng chữ cái.

> [!NOTE]
> Danh sách các nguồn được hỗ trợ khác nhau tùy theo trình duyệt, hệ điều hành và phần cứng, và đang thay đổi. Thuộc tính này chỉ là một gợi ý về các loại nguồn mà user agent hỗ trợ. Hãy gọi {{domxref("PressureObserver.observe()", "observe()")}} và kiểm tra `NotSupportedError` để xem liệu việc quan sát áp lực có khả thi không.

## Giá trị

Một mảng các giá trị {{domxref("PressureRecord.source")}}.

## Ví dụ

### Sử dụng console để xem các nguồn được biết

Để tìm hiểu trình duyệt biết các giá trị {{domxref("PressureRecord.source","source")}} nào, hãy nhập <kbd>PressureObserver.knownSources</kbd> vào console. Điều này sẽ trả về một mảng các nguồn đã biết.

```js
PressureObserver.knownSources;
// returns ["cpu"] in Chrome 125
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
