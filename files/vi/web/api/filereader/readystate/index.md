---
title: "FileReader: thuộc tính readyState"
short-title: readyState
slug: Web/API/FileReader/readyState
page-type: web-api-instance-property
browser-compat: api.FileReader.readyState
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("FileReader")}} cung cấp trạng thái hiện tại của thao tác đọc. Giá trị sẽ là một trong ba trạng thái: `EMPTY`, `LOADING`, hoặc `DONE`.

## Giá trị

Một số là một trong ba hằng số trạng thái được định nghĩa trên giao diện {{domxref("FileReader")}}:

- `FileReader.EMPTY` (0)
  - : Đối tượng đọc đã được tạo, nhưng chưa có phương thức đọc nào được gọi.
- `FileReader.LOADING` (1)
  - : Một phương thức đọc đã được gọi. Một {{domxref("File")}} hoặc {{domxref("Blob")}} đang được đọc và chưa xảy ra lỗi.
- `FileReader.DONE` (2)
  - : Thao tác đọc đã hoàn tất. Điều này có thể có nghĩa là: toàn bộ {{domxref("File")}} hoặc {{domxref("Blob")}} đã được đọc vào bộ nhớ, xảy ra lỗi đọc tệp, hoặc {{domxref("FileReader.abort()", "abort()")}} đã được gọi và việc đọc bị hủy.

## Ví dụ

```js
const reader = new FileReader();
console.log("EMPTY", reader.readyState); // readyState sẽ là 0

reader.readAsText(blob);
console.log("LOADING", reader.readyState); // readyState sẽ là 1

reader.onloadend = () => {
  console.log("DONE", reader.readyState); // readyState sẽ là 2
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Blob")}}
