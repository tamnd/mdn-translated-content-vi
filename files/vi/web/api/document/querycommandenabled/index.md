---
title: "Document: phương thức queryCommandEnabled()"
short-title: queryCommandEnabled()
slug: Web/API/Document/queryCommandEnabled
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.queryCommandEnabled
---

{{ApiRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

> [!NOTE]
> Mặc dù phương thức {{domxref("Document/execCommand", "execCommand()")}} đã lỗi thời, nếu bạn quyết định sử dụng nó vì những lý do được nêu trên trang đó, bạn nên cân nhắc kiểm tra khả năng sẵn có của lệnh bằng cách sử dụng `queryCommandEnabled()` để đảm bảo tương thích.

Phương thức **`Document.queryCommandEnabled()`** báo cáo liệu lệnh trình soạn thảo đã chỉ định có được trình duyệt bật hay không.

## Cú pháp

```js-nolint
queryCommandEnabled(command)
```

### Tham số

- `command`
  - : Lệnh cần xác định hỗ trợ.

### Giá trị trả về

Trả về một giá trị boolean là `true` nếu lệnh được bật và `false` nếu lệnh không được bật.

## Ghi chú

- Đối với các lệnh `"cut"` và `"copy"`, phương thức chỉ trả về true khi được gọi từ một luồng do người dùng khởi tạo.
- Lệnh `"paste"` trả về `false` không chỉ khi tính năng không khả dụng, mà còn nếu tập lệnh gọi nó không có đủ quyền để thực hiện hành động.

## Ví dụ

```js
const flg = document.queryCommandEnabled("SelectAll");

if (flg) {
  document.execCommand("SelectAll", false, null); // lệnh được bật, chạy nó
}
```

## Đặc tả kỹ thuật

Tính năng này không thuộc bất kỳ đặc tả kỹ thuật hiện tại nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn. Có một [bản nháp đặc tả W3C execCommand không chính thức](https://w3c.github.io/editing/docs/execCommand/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.execCommand()")}}
- {{domxref("document.queryCommandSupported()")}}
