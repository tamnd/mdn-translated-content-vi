---
title: "Performance: memory property"
short-title: memory
slug: Web/API/Performance/memory
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Performance.memory
---

{{APIRef("Performance API")}}{{Deprecated_Header}}{{Non-standard_header}}

Thuộc tính chỉ đọc **`memory`** kiểu cũ và không chuẩn trả về kích thước của JavaScript heap, có thể hữu ích để đo và giảm footprint bộ nhớ của trang web.

Lưu ý rằng thông tin do API này cung cấp là không đáng tin cậy vì nó có thể ước tính quá cao mức sử dụng bộ nhớ thực tế nếu các trang web chia sẻ cùng heap, hoặc ước tính quá thấp nếu các trang web dùng worker và/hoặc cross-site iframe được cấp phát trong các heap riêng. Chưa có chuẩn nào định nghĩa chính xác "heap" là gì. API này chỉ có trên các trình duyệt dựa trên Chromium.

API mới nhằm thay thế `performance.memory` là {{domxref("Performance.measureUserAgentSpecificMemory()")}}. Nó cố gắng ước tính bộ nhớ được dùng bởi một trang web.

## Giá trị

Trả về một đối tượng có các thuộc tính sau:

- `jsHeapSizeLimit`
  - : Kích thước tối đa của heap, tính bằng byte, có sẵn cho ngữ cảnh.
- `totalJSHeapSize`
  - : Tổng kích thước heap đã cấp phát, tính bằng byte.
- `usedJSHeapSize`
  - : Phần JavaScript heap đang được dùng hiện tại, tính bằng byte.

## Ví dụ

### Lấy kích thước JavaScript heap

Gọi `performance.memory` trả về một đối tượng như sau:

```json
{
  "totalJSHeapSize": 39973671,
  "usedJSHeapSize": 39127515,
  "jsHeapSizeLimit": 4294705152
}
```

## Thông số kỹ thuật

Không có.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.measureUserAgentSpecificMemory()")}}
