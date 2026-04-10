---
title: "Range: phương thức compareBoundaryPoints()"
short-title: compareBoundaryPoints()
slug: Web/API/Range/compareBoundaryPoints
page-type: web-api-instance-method
browser-compat: api.Range.compareBoundaryPoints
---

{{APIRef("DOM")}}

Phương thức **`compareBoundaryPoints()`** của giao diện {{domxref("Range")}} so sánh các điểm biên của `Range` với các điểm biên của một range khác.

## Cú pháp

```js-nolint
compareBoundaryPoints(how, otherRange)
```

### Tham số

- `how`
  - : Một hằng số mô tả cách so sánh:
    - `Range.END_TO_END` so sánh điểm biên cuối của `Range` này với điểm biên cuối của `otherRange`.
    - `Range.END_TO_START` so sánh điểm biên đầu của `Range` này với điểm biên cuối của `otherRange`.
    - `Range.START_TO_END` so sánh điểm biên cuối của `Range` này với điểm biên đầu của `otherRange`.
    - `Range.START_TO_START` so sánh điểm biên đầu của `Range` này với điểm biên đầu của `otherRange`.
- `otherRange`
  - : Một {{domxref("Range")}} để so sánh điểm biên với range này.

### Giá trị trả về

Một số.

- `-1` nếu điểm biên được chỉ định của `Range` này đứng trước điểm biên được chỉ định của `otherRange`.
- `0` nếu điểm biên được chỉ định của `Range` này giống với điểm biên được chỉ định của `otherRange`.
- `1` nếu điểm biên được chỉ định của `Range` này đứng sau điểm biên được chỉ định của `otherRange`.

API này nhất quán với quy ước chung rằng khi so sánh A với B, một số âm nghĩa là A đứng trước B và ngược lại. Các range được so sánh theo hướng từ `this` tới `other`. Tuy nhiên, thứ tự biên trong tham số `how` được chỉ định ngược lại: `END_TO_START` so sánh _đầu_ của `this` với _cuối_ của `other`.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị của tham số `how` không hợp lệ.

## Ví dụ

Dưới đây, chúng ta tạo hai range trên cùng một nút văn bản và so sánh các điểm biên khác nhau của chúng.

```js
const text = new Text("0123456789");

const thisRange = new Range();
thisRange.setStart(text, 1);
thisRange.setEnd(text, 6);

const otherRange = new Range();
otherRange.setStart(text, 1);
otherRange.setEnd(text, 4);

// Các range trông như sau:
// thisRange start   v---------v thisRange end
//                  0 1 2 3 4 5 6 7 8 9
// otherRange start  ^-----^ otherRange end

// this start *giống* other start
thisRange.compareBoundaryPoints(Range.START_TO_START, otherRange); // 0

// this end *sau* other start
thisRange.compareBoundaryPoints(Range.START_TO_END, otherRange); // 1

// this start *trước* other end
thisRange.compareBoundaryPoints(Range.END_TO_START, otherRange); // -1

// this end *sau* other end
thisRange.compareBoundaryPoints(Range.END_TO_END, otherRange); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
