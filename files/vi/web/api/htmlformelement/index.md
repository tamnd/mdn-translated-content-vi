---
title: HTMLFormElement
slug: Web/API/HTMLFormElement
page-type: web-api-interface
browser-compat: api.HTMLFormElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLFormElement`** đại diện cho phần tử {{HTMLElement("form")}} trong DOM. Nó cho phép truy cập—và trong một số trường hợp, sửa đổi—các khía cạnh của biểu mẫu, cũng như truy cập các phần tử thành phần của nó.

{{InheritanceDiagram}}

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính từ phần tử cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLFormElement.acceptCharset")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`accept-charset`](/en-US/docs/Web/HTML/Reference/Elements/form#accept-charset) của biểu mẫu.
- {{domxref("HTMLFormElement.action")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của biểu mẫu, chứa URI của chương trình xử lý thông tin do biểu mẫu gửi đi.
- {{domxref("HTMLFormElement.autocomplete")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) của biểu mẫu, cho biết liệu các điều khiển trong biểu mẫu này có thể được trình duyệt tự động điền giá trị hay không.
- {{domxref("HTMLFormElement.encoding")}} hoặc {{domxref("HTMLFormElement.enctype")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu, cho biết loại nội dung được sử dụng để truyền biểu mẫu đến máy chủ. Chỉ có thể đặt các giá trị được chỉ định. Hai thuộc tính này là từ đồng nghĩa.
- {{domxref("HTMLFormElement.elements")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLFormControlsCollection")}} chứa tất cả các điều khiển biểu mẫu thuộc về phần tử biểu mẫu này.
- {{domxref("HTMLFormElement.length")}} {{ReadOnlyInline}}
  - : Một `long` phản ánh số lượng điều khiển trong biểu mẫu.
- {{domxref("HTMLFormElement.name")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/form#name) của biểu mẫu, chứa tên của biểu mẫu.
- {{domxref("HTMLFormElement.noValidate")}}
  - : Một giá trị boolean phản ánh giá trị của thuộc tính HTML [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của biểu mẫu, cho biết liệu biểu mẫu có nên bỏ qua xác thực hay không.
- {{domxref("HTMLFormElement.method")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của biểu mẫu, cho biết phương thức HTTP được sử dụng để gửi biểu mẫu. Chỉ có thể đặt các giá trị được chỉ định.
- {{domxref("HTMLFormElement.rel")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) của biểu mẫu, đại diện cho các loại liên kết mà biểu mẫu tạo ra dưới dạng danh sách các giá trị liệt kê được phân tách bằng khoảng trắng.
- {{domxref("HTMLFormElement.relList")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel), dưới dạng danh sách các token.
- {{domxref("HTMLFormElement.target")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính HTML [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của biểu mẫu, cho biết nơi hiển thị kết quả nhận được từ việc gửi biểu mẫu.

Các input có tên được thêm vào instance biểu mẫu sở hữu chúng dưới dạng thuộc tính và có thể ghi đè các thuộc tính gốc nếu chúng chia sẻ cùng tên (ví dụ: một biểu mẫu có input tên là `action` sẽ có thuộc tính `action` trả về input đó thay vì thuộc tính HTML [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của biểu mẫu).

## Phương thức instance

_Giao diện này cũng kế thừa các phương thức từ phần tử cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLFormElement.checkValidity", "checkValidity()")}}
  - : Trả về `true` nếu các điều khiển con của phần tử phải chịu [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) và thỏa mãn các ràng buộc đó; trả về `false` nếu một số điều khiển không thỏa mãn ràng buộc của chúng. Gửi một sự kiện có tên {{domxref("HTMLInputElement/invalid_event", "invalid")}} đến bất kỳ điều khiển nào không thỏa mãn ràng buộc của nó; các điều khiển như vậy được coi là không hợp lệ nếu sự kiện không bị hủy. Lập trình viên sẽ quyết định cách phản hồi với giá trị `false`.
- {{domxref("HTMLFormElement.reportValidity", "reportValidity()")}}
  - : Trả về `true` nếu các điều khiển con của phần tử thỏa mãn [ràng buộc xác thực](/en-US/docs/Web/HTML/Guides/Constraint_validation) của chúng. Khi trả về `false`, các sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}} có thể hủy sẽ được gửi cho mỗi phần tử con không hợp lệ và các vấn đề xác thực sẽ được báo cáo cho người dùng.
- {{domxref("HTMLFormElement.requestSubmit", "requestSubmit()")}}
  - : Yêu cầu biểu mẫu được gửi bằng nút gửi được chỉ định và cấu hình tương ứng của nó.
- {{domxref("HTMLFormElement.reset", "reset()")}}
  - : Đặt lại biểu mẫu về trạng thái ban đầu.
- {{domxref("HTMLFormElement.submit", "submit()")}}
  - : Gửi biểu mẫu đến máy chủ.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng `addEventListener()`, hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("HTMLFormElement/formdata_event", "formdata")}}
  - : Sự kiện `formdata` được kích hoạt sau khi danh sách entry đại diện cho dữ liệu của biểu mẫu được xây dựng.
- {{domxref("HTMLFormElement/reset_event", "reset")}}
  - : Sự kiện `reset` được kích hoạt khi một biểu mẫu được đặt lại.
- {{domxref("HTMLFormElement/submit_event", "submit")}}
  - : Sự kiện `submit` được kích hoạt khi một biểu mẫu được gửi.

## Ghi chú sử dụng

### Lấy đối tượng phần tử biểu mẫu

Để lấy đối tượng `HTMLFormElement`, bạn có thể sử dụng [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors) với {{domxref("Document.querySelector", "querySelector()")}}, hoặc bạn có thể lấy danh sách tất cả các biểu mẫu trong tài liệu bằng thuộc tính {{domxref("Document.forms", "forms")}} của nó.

{{domxref("Document.forms")}} trả về một mảng các đối tượng `HTMLFormElement` liệt kê từng biểu mẫu trên trang. Sau đó bạn có thể sử dụng bất kỳ cú pháp nào sau đây để lấy một biểu mẫu riêng lẻ:

- `document.forms[index]`
  - : Trả về biểu mẫu tại `index` được chỉ định trong mảng biểu mẫu.
- `document.forms[id]`
  - : Trả về biểu mẫu có ID là `id`.
- `document.forms[name]`
  - : Trả về biểu mẫu có giá trị thuộc tính `name` là `name`.

### Truy cập các phần tử của biểu mẫu

Bạn có thể truy cập danh sách các phần tử chứa dữ liệu của biểu mẫu bằng cách kiểm tra thuộc tính {{domxref("HTMLFormElement.elements", "elements")}} của biểu mẫu. Thao tác này trả về một {{domxref("HTMLFormControlsCollection")}} liệt kê tất cả các phần tử nhập dữ liệu người dùng của biểu mẫu, cả những phần tử là hậu duệ của `<form>` và những phần tử được làm thành viên của biểu mẫu bằng thuộc tính `form` của chúng.

Bạn cũng có thể lấy phần tử của biểu mẫu bằng cách sử dụng thuộc tính `name` của nó làm khóa của `form`, nhưng sử dụng `elements` là cách tiếp cận tốt hơn—nó chỉ chứa _các phần tử_ của biểu mẫu và không thể bị lẫn với các thuộc tính khác của `form`.

### Vấn đề khi đặt tên phần tử

Một số tên sẽ cản trở việc truy cập JavaScript vào các thuộc tính và phần tử của biểu mẫu.

Ví dụ:

- `<input name="id">` sẽ được ưu tiên hơn `<form id="…">`. Điều này có nghĩa là `form.id` sẽ không trỏ đến id của biểu mẫu, mà đến phần tử có tên là `"id"`. Điều này sẽ đúng với bất kỳ thuộc tính biểu mẫu nào khác, chẳng hạn như `<input name="action">` hoặc `<input name="post">`.
- `<input name="elements">` sẽ làm cho bộ sưu tập `elements` của biểu mẫu không thể truy cập được. Tham chiếu `form.elements` giờ đây sẽ trỏ đến phần tử riêng lẻ.

Để tránh các vấn đề như vậy với tên phần tử:

- _Luôn_ sử dụng bộ sưu tập `elements` để tránh nhầm lẫn giữa tên phần tử và thuộc tính biểu mẫu.
- _Không bao giờ_ sử dụng `"elements"` làm tên phần tử.

Nếu bạn không sử dụng JavaScript, điều này sẽ không gây ra vấn đề gì.

### Các phần tử được coi là điều khiển biểu mẫu

Các phần tử được bao gồm bởi `HTMLFormElement.elements` và `HTMLFormElement.length` là các phần tử sau:

- {{HTMLElement("button")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("input")}} (ngoại trừ bất kỳ phần tử nào có [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `"image"` bị loại bỏ vì lý do lịch sử)
- {{HTMLElement("object")}}
- {{HTMLElement("output")}}
- {{HTMLElement("select")}}
- {{HTMLElement("textarea")}}

Không có phần tử nào khác được bao gồm trong danh sách trả về bởi `elements`, điều này làm cho nó trở thành một cách tuyệt vời để truy cập các phần tử quan trọng nhất khi xử lý biểu mẫu.

## Ví dụ

Tạo một phần tử biểu mẫu mới, sửa đổi các thuộc tính của nó, sau đó gửi nó:

```js
const f = document.createElement("form"); // Tạo một biểu mẫu
document.body.appendChild(f); // Thêm vào body của document
f.action = "/cgi-bin/some.cgi"; // Thêm thuộc tính action và method
f.method = "POST";
f.submit(); // Gọi phương thức submit() của biểu mẫu
```

Trích xuất thông tin từ phần tử `<form>` và đặt một số thuộc tính của nó:

```html
<form name="formA" action="/cgi-bin/test" method="post">
  <p>Nhấn "Info" để xem chi tiết biểu mẫu, hoặc "Set" để thay đổi chi tiết đó.</p>
  <p>
    <button type="button" id="info">Info</button>
    <button type="button" id="set-info">Set</button>
    <button type="reset">Reset</button>
  </p>

  <textarea id="form-info" rows="15" cols="20"></textarea>
</form>
```

```js
document.getElementById("info").addEventListener("click", () => {
  // Lấy tham chiếu đến biểu mẫu qua tên của nó
  const f = document.forms["formA"];
  // Các thuộc tính biểu mẫu chúng ta quan tâm
  const properties = [
    "elements",
    "length",
    "name",
    "charset",
    "action",
    "acceptCharset",
    "action",
    "enctype",
    "method",
    "target",
  ];
  // Lặp qua các thuộc tính, biến chúng thành chuỗi mà chúng ta có thể hiển thị cho người dùng
  const info = properties
    .map((property) => `${property}: ${f[property]}`)
    .join("\n");

  // Đặt <textarea> của biểu mẫu để hiển thị các thuộc tính của biểu mẫu
  document.forms["formA"].elements["form-info"].value = info; // document.forms["formA"]['form-info'].value cũng hoạt động
});

document.getElementById("set-info").addEventListener("click", (e) => {
  // Lấy tham chiếu đến biểu mẫu qua sự kiện target
  // e.target là nút bấm, và .form là biểu mẫu mà nó thuộc về
  const f = e.target.form;
  // Tham số nên là một tham chiếu phần tử biểu mẫu.
  f.action = "a-different-url.cgi";
  f.name = "a-different-name";
});
```

Gửi `<form>` vào một cửa sổ mới:

```html
<form action="test.php" target="_blank">
  <p>
    <label>Tên: <input type="text" name="first-name" /></label>
  </p>
  <p>
    <label>Họ: <input type="text" name="last-name" /></label>
  </p>
  <p>
    <label><input type="password" name="pwd" /></label>
  </p>

  <fieldset>
    <legend>Ưu tiên thú cưng</legend>

    <p>
      <label><input type="radio" name="pet" value="cat" /> Mèo</label>
    </p>
    <p>
      <label><input type="radio" name="pet" value="dog" /> Chó</label>
    </p>
  </fieldset>

  <fieldset>
    <legend>Phương tiện sở hữu</legend>

    <p>
      <label
        ><input type="checkbox" name="vehicle" value="Bike" />Tôi có một
        chiếc xe máy</label
      >
    </p>
    <p>
      <label
        ><input type="checkbox" name="vehicle" value="Car" />Tôi có một
        chiếc ô tô</label
      >
    </p>
  </fieldset>

  <p><button>Gửi</button></p>
</form>
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("form")}}.
