---
title: "SVGLengthList: insertItemBefore() method"
short-title: insertItemBefore()
slug: Web/API/SVGLengthList/insertItemBefore
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.insertItemBefore
---

{{APIRef("SVG")}}

Phương thức **`insertItemBefore()`** của giao diện {{domxref("SVGLengthList")}} chèn một phần tử mới vào danh sách tại vị trí được chỉ định. Phần tử đầu tiên có chỉ mục 0. Phần tử được chèn là chính phần tử đó, không phải bản sao.

- Nếu phần tử mới đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này.
- Nếu phần tử đã có trong danh sách này, lưu ý rằng chỉ mục của phần tử cần chèn trước là trước khi xóa phần tử.
- Nếu chỉ mục bằng 0, phần tử mới được chèn vào đầu danh sách.
- Nếu chỉ mục lớn hơn hoặc bằng {{domxref("SVGLengthList.length", "length")}}, phần tử mới được thêm vào cuối danh sách.

## Cú pháp

```js-nolint
insertItemBefore(newItem, index)
```

### Tham số

- `newItem`
  - : {{domxref("SVGLength")}} cần thêm vào danh sách.
- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần chèn phần tử mới vào trước đó.

### Giá trị trả về

{{domxref("SVGLength")}} đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi danh sách là chỉ đọc.

## Ví dụ

Xem {{domxref("SVGLengthList")}} để xem ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
