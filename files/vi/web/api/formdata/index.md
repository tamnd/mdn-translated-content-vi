---
title: FormData
slug: Web/API/FormData
page-type: web-api-interface
browser-compat: api.FormData
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

**`FormData`** là một giao diện cho phép bạn tạo một tập hợp các cặp khóa/giá trị đại diện cho các trường biểu mẫu và giá trị của chúng, có thể được gửi bằng các phương thức {{domxref("Window/fetch", "fetch()")}}, {{domxref("XMLHttpRequest.send()")}} hoặc {{domxref("navigator.sendBeacon()")}}. Nó dùng cùng định dạng mà một biểu mẫu sẽ dùng nếu kiểu mã hóa được đặt thành `"multipart/form-data"`.

Bạn cũng có thể truyền trực tiếp nó vào hàm tạo {{domxref("URLSearchParams")}} nếu muốn tạo các tham số truy vấn theo cách mà một {{HTMLElement("form")}} sẽ làm nếu nó đang dùng phương thức `GET` đơn giản.

Một đối tượng triển khai `FormData` có thể được dùng trực tiếp trong cấu trúc {{jsxref("Statements/for...of", "for...of")}}, thay vì {{domxref('FormData.entries()', 'entries()')}}: `for (const p of myFormData)` tương đương với `for (const p of myFormData.entries())`.

## Hàm khởi tạo

- {{domxref("FormData.FormData","FormData()")}}
  - : Tạo một đối tượng `FormData` mới.

## Các phương thức của thể hiện

- {{domxref("FormData.append()")}}
  - : Thêm một giá trị mới vào sau một khóa hiện có trong đối tượng `FormData`, hoặc thêm khóa đó nếu nó chưa tồn tại.
- {{domxref("FormData.delete()")}}
  - : Xóa một cặp khóa/giá trị khỏi đối tượng `FormData`.
- {{domxref("FormData.entries()")}}
  - : Trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các cặp khóa/giá trị có trong `FormData`.
- {{domxref("FormData.get()")}}
  - : Trả về giá trị đầu tiên liên kết với một khóa cho trước bên trong đối tượng `FormData`.
- {{domxref("FormData.getAll()")}}
  - : Trả về một mảng gồm tất cả các giá trị liên kết với một khóa cho trước bên trong `FormData`.
- {{domxref("FormData.has()")}}
  - : Trả về việc một đối tượng `FormData` có chứa một khóa nhất định hay không.
- {{domxref("FormData.keys()")}}
  - : Trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các khóa của các cặp khóa/giá trị có trong `FormData`.
- {{domxref("FormData.set()")}}
  - : Đặt một giá trị mới cho một khóa hiện có bên trong đối tượng `FormData`, hoặc thêm cặp khóa/giá trị nếu nó chưa tồn tại.
- {{domxref("FormData.values()")}}
  - : Trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các giá trị có trong `FormData`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
