---
title: "StorageEvent: constructor StorageEvent()"
short-title: StorageEvent()
slug: Web/API/StorageEvent/StorageEvent
page-type: web-api-constructor
browser-compat: api.StorageEvent.StorageEvent
---

{{ApiRef("Web Storage API")}}

Constructor **`StorageEvent()`** tạo một đối tượng {{domxref("StorageEvent")}} mới.

## Cú pháp

```js-nolint
new StorageEvent(type)
new StorageEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của kiểu `StorageEvent`. Nó phân biệt hoa thường và các trình duyệt đặt nó thành `storage`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, còn có các thuộc tính sau:
    - `key` {{optional_inline}}
      - : Một chuỗi biểu thị khóa của mục lưu trữ đã thay đổi. Mặc định là `null`.
    - `oldValue` {{optional_inline}}
      - : Một chuỗi chứa giá trị gốc của mục lưu trữ. Mặc định là `null`.
    - `newValue` {{optional_inline}}
      - : Một chuỗi chứa giá trị mới của `key`. Mặc định là `null`.
    - `url`
      - : Một chuỗi chứa URL của tài liệu mà storage của nó đã thay đổi.
    - `storageArea` {{optional_inline}}
      - : Một đối tượng {{DOMxRef("Storage")}} đại diện cho storage bị ảnh hưởng. Mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("StorageEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web Storage API", "", "", "nocode")}}
