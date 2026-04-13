---
title: EditContext API
slug: Web/API/EditContext_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.EditContext
---

{{DefaultAPISidebar("EditContext API")}}{{SeeCompatTable}}

**EditContext API** có thể được sử dụng để xây dựng các trình chỉnh sửa văn bản phong phú trên web hỗ trợ các trải nghiệm nhập văn bản nâng cao, như soạn thảo {{glossary("Input Method Editor")}} (IME), bảng chọn emoji, hoặc bất kỳ bề mặt UI liên quan đến chỉnh sửa cụ thể theo nền tảng nào khác.

Với EditContext API, bạn có sự linh hoạt để kết xuất vùng văn bản có thể chỉnh sửa của riêng mình bằng bất kỳ công nghệ nào bạn muốn.

## Khái niệm

Nhiều tác nhân tham gia khi nhập văn bản trong vùng có thể chỉnh sửa của ứng dụng:

- **Người dùng**
  - : Người dùng cung cấp văn bản bằng phương thức nhập: bàn phím, chuột, giọng nói, hoặc phương thức nhập khác.
- **Phần mềm phương thức nhập**
  - : Phần mềm phương thức nhập chuyển đổi đầu vào của người dùng thành văn bản. Ví dụ, đây có thể là {{glossary("Input Method Editor")}} (IME) chuyển đổi tổ hợp phím từ bàn phím tiêu chuẩn thành ký tự tiếng Nhật, Trung hoặc Hàn.
- **Dịch vụ nhập văn bản của hệ điều hành**
  - : Dịch vụ nhập văn bản của hệ điều hành hoạt động như một liên kết giữa phần mềm phương thức nhập và ứng dụng.
- **Ngữ cảnh chỉnh sửa văn bản ứng dụng**
  - : Ngữ cảnh chỉnh sửa văn bản ứng dụng cung cấp trạng thái của văn bản đang được chỉnh sửa. Trạng thái chứa thông tin như bản thân văn bản, lựa chọn hiện tại, vị trí của văn bản trong UI của ứng dụng.
- **Vùng có thể chỉnh sửa của ứng dụng**
  - : Vùng có thể chỉnh sửa của ứng dụng là phần tử UI của ứng dụng hiển thị văn bản.

Trong khi ba tác nhân đầu được cung cấp bởi hệ điều hành, ứng dụng có trách nhiệm cung cấp vùng có thể chỉnh sửa và ngữ cảnh chỉnh sửa văn bản.

Trên web, các vùng có thể chỉnh sửa thường là các phần tử [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/textarea), phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input), hoặc các phần tử có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt thành `true`. Đối với các phần tử này, trình duyệt tự động cung cấp ngữ cảnh chỉnh sửa văn bản, và các tác giả web không cần viết bất kỳ mã nào để hỗ trợ nhập văn bản.

### Tạo vùng có thể chỉnh sửa tùy chỉnh

Các tác giả web cũng có thể tạo các vùng có thể chỉnh sửa tùy chỉnh bằng EditContext API. Ví dụ, tác giả web có thể tạo trình chỉnh sửa văn bản phong phú bằng phần tử [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas) để kết xuất văn bản. Trong trường hợp này, tác giả web cần viết mã để hỗ trợ nhập văn bản.

### Trách nhiệm của tác giả

Nếu bạn quyết định triển khai vùng có thể chỉnh sửa của riêng mình, dù nó vẽ văn bản vào `<canvas>` hay kết xuất nó thành một chuỗi phần tử DOM, bạn có trách nhiệm cung cấp những thứ mà trình duyệt thường cung cấp cho bạn nếu bạn sử dụng `<textarea>`. Điều này bao gồm:

- Kết xuất văn bản.
- Kết xuất lựa chọn (nếu bạn xây dựng vùng có thể chỉnh sửa với phần tử DOM thay vì `<canvas>`, trình duyệt có kết xuất lựa chọn cho bạn).
- Thông báo cho dịch vụ nhập văn bản của hệ điều hành khi lựa chọn thay đổi.
- Thông báo cho dịch vụ nhập văn bản của hệ điều hành về vị trí của văn bản trong UI, để phần mềm phương thức nhập có thể hiển thị cửa sổ soạn thảo IME ở đúng vị trí.
- Áp dụng một số định dạng văn bản nhất định khi người dùng đang soạn thảo văn bản trong cửa sổ soạn thảo IME.

Đổi lại, EditContext API làm cho phần tử DOM bạn chọn có thể chỉnh sửa và là một phần của thứ tự focus của tài liệu. Ngoài ra, EditContext API cũng cung cấp thông tin về trạng thái của văn bản đang được chỉnh sửa, cho phép bạn kết xuất nó theo cách tùy chỉnh.

### Khả năng truy cập

Nếu bạn sử dụng EditContext API với phần tử `<canvas>`, hãy đảm bảo làm cho văn bản có thể truy cập được bởi công nghệ hỗ trợ. Trình đọc màn hình không thể đọc văn bản trong phần tử `<canvas>`. Ví dụ, bạn có thể duy trì một chế độ xem riêng biệt của văn bản trong phần tử DOM ngoài màn hình được trình bày cho trình đọc màn hình.

### Cách sử dụng cơ bản

Để sử dụng EditContext API, bạn cần tạo một đối tượng giao diện {{domxref("EditContext")}}, sau đó đính kèm nó vào phần tử DOM bạn muốn làm có thể chỉnh sửa bằng cách sử dụng thuộc tính {{domxref("HTMLElement/editContext", "editContext")}}. Phần tử DOM có thể là bất kỳ phần tử nào, bao gồm `<div>` hoặc phần tử `<canvas>`.

```html
<canvas id="editor-canvas"></canvas>
```

```js-nolint
const canvas = document.getElementById("editor-canvas");
const editContext = new EditContext();
canvas.editContext = editContext;
```

Một đối tượng `EditContext` chỉ có thể được đính kèm vào một phần tử DOM tại một thời điểm.

Việc đính kèm đối tượng `EditContext` vào phần tử DOM làm cho phần tử có thể focus, như là một phần của thứ tự focus của tài liệu. Người dùng có thể nhập văn bản vào phần tử bằng phương thức nhập mà họ chọn, và bạn có thể sử dụng sự kiện được kích hoạt bởi đối tượng `EditContext` để kết xuất văn bản và lựa chọn.

### Kiến trúc mô hình và khung nhìn

Khi sử dụng EditContext API, việc xây dựng trải nghiệm chỉnh sửa của bạn như một kiến trúc mô hình và khung nhìn sẽ hữu ích.

Đối tượng `EditContext` đại diện cho mô hình của vùng có thể chỉnh sửa. Trạng thái nội bộ của nó được cập nhật khi nhận được đầu vào văn bản và khi lựa chọn thay đổi.

Sau đó bạn có thể kết xuất văn bản và lựa chọn trong khung nhìn, sử dụng thông tin được cung cấp bởi đối tượng `EditContext`, tuy nhiên khung nhìn của bạn không cần phải khớp chính xác với mô hình. Bạn tự do kết xuất văn bản theo bất kỳ cách nào bạn muốn.

## Giao diện

- {{DOMxRef("EditContext")}} {{experimental_inline}}
  - : Giao diện `EditContext` là phản ánh JavaScript của ngữ cảnh chỉnh sửa văn bản thường được trình duyệt cung cấp một cách minh bạch khi sử dụng các vùng có thể chỉnh sửa tiêu chuẩn như `textarea`. `EditContext` cung cấp trạng thái của văn bản đang được chỉnh sửa, với thông tin như bản thân văn bản, lựa chọn hiện tại, hoặc vị trí của văn bản trong UI của ứng dụng.
- {{DOMxRef("TextFormat")}} {{experimental_inline}}
  - : Giao diện `TextFormat` được sử dụng để đại diện cho một số định dạng nhất định cần được áp dụng cho các phạm vi văn bản khi người dùng đang soạn thảo văn bản trong cửa sổ soạn thảo IME.
- {{domxref("TextUpdateEvent")}} {{experimental_inline}}
  - : Giao diện `TextUpdateEvent` là một [sự kiện DOM](/en-US/docs/Web/API/Event) đại diện cho cập nhật văn bản hoặc lựa chọn trong vùng văn bản có thể chỉnh sửa được đính kèm vào đối tượng {{domxref("EditContext")}}.
- {{domxref("TextFormatUpdateEvent")}} {{experimental_inline}}
  - : Giao diện `TextFormatUpdateEvent` là một [sự kiện DOM](/en-US/docs/Web/API/Event) đại diện cho danh sách các định dạng văn bản mà cửa sổ {{glossary("Input Method Editor")}} (IME) muốn áp dụng cho văn bản đang được soạn thảo trong vùng có thể chỉnh sửa được đính kèm vào đối tượng {{domxref("EditContext")}}.
- {{domxref("CharacterBoundsUpdateEvent")}} {{experimental_inline}}
  - : Giao diện `CharacterBoundsUpdateEvent` là một [sự kiện DOM](/en-US/docs/Web/API/Event) đại diện cho yêu cầu từ hệ điều hành để biết giới hạn của các ký tự nhất định trong vùng có thể chỉnh sửa được đính kèm vào đối tượng {{domxref("EditContext")}}.

## Phần mở rộng cho các giao diện khác

- {{domxref("HTMLElement.editContext")}} {{experimental_inline}}
  - : Thuộc tính `editContext` của giao diện {{domxref("HTMLElement")}} lấy và đặt đối tượng {{domxref("EditContext")}} liên kết với phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng EditContext API](/en-US/docs/Web/API/EditContext_API/Guide)
