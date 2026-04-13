---
title: Sending and Receiving Binary Data
slug: Web/API/XMLHttpRequest_API/Sending_and_Receiving_Binary_Data
page-type: guide
---

{{DefaultAPISidebar("XMLHttpRequest API")}}

## Nhận dữ liệu nhị phân

Thuộc tính `responseType` của đối tượng XMLHttpRequest có thể được đặt để thay đổi kiểu phản hồi mong đợi từ máy chủ. Các giá trị hợp lệ là chuỗi rỗng (mặc định), `"arraybuffer"`, `"blob"`, `"document"`, `"json"`, và `"text"`. Thuộc tính `response` sẽ chứa phần thân thực thể theo `responseType`, dưới dạng `ArrayBuffer`, `Blob`, `Document`, `JSON`, hoặc chuỗi. Giá trị này là `null` nếu yêu cầu chưa hoàn tất hoặc không thành công.

Ví dụ này đọc một hình ảnh như một tệp nhị phân và tạo một mảng số nguyên không dấu 8 bit từ các byte thô. Lưu ý rằng cách này sẽ không giải mã hình ảnh và đọc các pixel. Việc đó có thể được thực hiện bằng giao diện {{domxref("ImageDecoder")}}.

```js
const req = new XMLHttpRequest();
req.open("GET", "/myfile.png", true);
req.responseType = "arraybuffer";

req.onload = (event) => {
  const arrayBuffer = req.response; // Lưu ý: không phải req.responseText
  if (arrayBuffer) {
    const byteArray = new Uint8Array(arrayBuffer);
    byteArray.forEach((element, index) => {
      // làm gì đó với từng byte trong mảng
    });
  }
};

req.send(null);
```

Bạn cũng có thể đọc một tệp nhị phân dưới dạng {{domxref("Blob")}} bằng cách đặt chuỗi `"blob"` cho thuộc tính `responseType`.

```js
const req = new XMLHttpRequest();
req.open("GET", "/myfile.png", true);
req.responseType = "blob";

req.onload = (event) => {
  const blob = req.response;
  // …
};

req.send();
```

## Gửi dữ liệu nhị phân

Phương thức `send` của XMLHttpRequest đã được mở rộng để cho phép truyền dữ liệu nhị phân dễ dàng bằng cách nhận một đối tượng [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer), {{domxref("Blob")}}, hoặc {{domxref("File")}}.

Ví dụ sau tạo một tệp văn bản ngay tại chỗ và dùng phương thức `POST` để gửi "tệp" đó đến máy chủ. Ví dụ này dùng văn bản thuần, nhưng bạn có thể hình dung dữ liệu là một tệp nhị phân thay thế.

```js
const req = new XMLHttpRequest();
req.open("POST", url, true);
req.onload = (event) => {
  // Đã tải lên
};

const blob = new Blob(["abc123"], { type: "text/plain" });

req.send(blob);
```

## Gửi typed array dưới dạng dữ liệu nhị phân

Bạn cũng có thể gửi typed array của JavaScript dưới dạng dữ liệu nhị phân.

```js
// Tạo một mảng mới với dữ liệu giả (dãy số liên tiếp (0 - 255), quay vòng về 0)
const array = new Uint8Array(512).map((v, i) => i);

const xhr = new XMLHttpRequest();
xhr.open("POST", url, false);
xhr.send(array);
```

Đoạn này đang tạo một mảng 512 byte gồm các số nguyên 8 bit và gửi nó đi; tất nhiên bạn có thể dùng bất kỳ dữ liệu nhị phân nào mình muốn.

## Gửi biểu mẫu và tải tệp lên

Xem [`FormData`](/en-US/docs/Web/API/FormData).
