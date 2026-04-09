---
title: Các thuộc tính toàn cục của MathML
short-title: Global attributes
slug: Web/MathML/Reference/Global_attributes
page-type: landing-page
browser-compat: mathml.global_attributes
sidebar: mathmlref
---

**Thuộc tính toàn cục** là các thuộc tính dùng chung cho mọi phần tử MathML; chúng có thể được dùng trên tất cả phần tử, dù có thể không có tác dụng trên một số phần tử.

Các thuộc tính toàn cục có thể được chỉ định trên mọi [phần tử MathML](/en-US/docs/Web/MathML/Reference/Element), _kể cả những phần tử không được chỉ định trong tiêu chuẩn_. Điều đó có nghĩa là bất kỳ phần tử không chuẩn nào vẫn phải cho phép các thuộc tính này, dù việc dùng các phần tử đó khiến tài liệu không còn tuân thủ MathML nữa.

Ngoài các thuộc tính toàn cục MathML cơ bản, còn có các thuộc tính toàn cục sau:

- Các thuộc tính [trình xử lý sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#registering_event_handlers) như **`onclick`**, **`onfocus`**, v.v.
- Thuộc tính [`href`](/en-US/docs/Web/MathML/Reference/Global_attributes/href) để biến phần tử MathML thành một siêu liên kết.

## Danh sách thuộc tính toàn cục

- [`autofocus`](/en-US/docs/Web/MathML/Reference/Global_attributes/autofocus)
  - : Thuộc tính boolean cho biết phần tử nên được lấy focus khi trang tải xong.
- [`class`](/en-US/docs/Web/MathML/Reference/Global_attributes/class)
  - : Danh sách các lớp của phần tử, được ngăn cách bằng khoảng trắng. Các lớp cho phép CSS và JavaScript chọn và truy cập các phần tử cụ thể thông qua [bộ chọn lớp](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) hoặc các hàm như phương thức {{DOMxRef("Document.getElementsByClassName()")}}.
- [`data-*`](/en-US/docs/Web/MathML/Reference/Global_attributes/data-*)
  - : Tạo thành một lớp thuộc tính, gọi là thuộc tính dữ liệu tùy biến, cho phép trao đổi thông tin riêng giữa [MathML](/en-US/docs/Web/MathML) và biểu diễn {{glossary("DOM")}} của nó, có thể được script sử dụng. Mọi dữ liệu tùy biến như vậy đều có thể truy cập thông qua giao diện {{DOMxRef("MathMLElement")}} của phần tử mà thuộc tính được đặt trên đó. Thuộc tính {{DOMxRef("MathMLElement.dataset")}} cho phép truy cập chúng.
- [`dir`](/en-US/docs/Web/MathML/Reference/Global_attributes/dir)
  - : Thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) cho biết hướng của phần tử MathML. Nó có thể có các giá trị sau:
    - `ltr`, nghĩa là _từ trái sang phải_ và được dùng để hiển thị biểu thức toán học từ trái sang phải (ví dụ kiểu tiếng Anh hoặc Maroc);
    - `rtl`, nghĩa là _từ phải sang trái_ và được dùng để hiển thị biểu thức toán học từ phải sang trái (ví dụ kiểu Maghreb hoặc Machrek);
- [`displaystyle`](/en-US/docs/Web/MathML/Reference/Global_attributes/displaystyle):
  - : Một boolean đặt [math-style](/en-US/docs/Web/CSS/Reference/Properties/math-style) cho phần tử.
    - `true`, nghĩa là `normal`.
    - `false`, nghĩa là `compact`.
- [`id`](/en-US/docs/Web/MathML/Reference/Global_attributes/id)
  - : Định nghĩa một mã định danh duy nhất (ID) phải duy nhất trên toàn bộ tài liệu. Mục đích là xác định phần tử khi liên kết (dùng fragment identifier), scripting hoặc tạo kiểu (bằng CSS).
- [`mathbackground`](/en-US/docs/Web/MathML/Reference/Global_attributes/mathbackground)
  - : Một [background-color](/en-US/docs/Web/CSS/Reference/Properties/background-color) cho phần tử.
- [`mathcolor`](/en-US/docs/Web/MathML/Reference/Global_attributes/mathcolor)
  - : Một [color](/en-US/docs/Web/CSS/Reference/Properties/color) cho phần tử.
- [`mathsize`](/en-US/docs/Web/MathML/Reference/Global_attributes/mathsize)
  - : Một {{cssxref("length-percentage")}} được dùng làm [font-size](/en-US/docs/Web/CSS/Reference/Properties/font-size) cho phần tử.
- [`nonce`](/en-US/docs/Web/MathML/Reference/Global_attributes/nonce)
  - : Một {{Glossary("Nonce", "nonce")}} mật mã ("số dùng một lần") có thể được [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) dùng để xác định một lần fetch có được phép tiếp tục hay không.
- [`scriptlevel`](/en-US/docs/Web/MathML/Reference/Global_attributes/scriptlevel)
  - : Chỉ định [math-depth](/en-US/docs/Web/CSS/Reference/Properties/math-depth) cho phần tử. Xem trang [scriptlevel](/en-US/docs/Web/MathML/Reference/Global_attributes/scriptlevel#values) để biết các giá trị được chấp nhận và cách ánh xạ.
- [`style`](/en-US/docs/Web/MathML/Reference/Global_attributes/style)
  - : Chứa các khai báo tạo kiểu [CSS](/en-US/docs/Web/CSS) được áp dụng cho phần tử. Lưu ý rằng nên định nghĩa style trong một hay nhiều tệp riêng. Thuộc tính này và phần tử {{HTMLElement("style")}} chủ yếu dùng cho tạo kiểu nhanh, ví dụ để thử nghiệm.
- [`tabindex`](/en-US/docs/Web/MathML/Reference/Global_attributes/tabindex)
  - : Thuộc tính số nguyên cho biết phần tử có thể nhận focus nhập liệu hay không (_focusable_), có nên tham gia điều hướng bàn phím tuần tự hay không, và nếu có thì ở vị trí nào. Nó có thể nhận nhiều giá trị:
    - một _giá trị âm_ nghĩa là phần tử nên focusable nhưng không thể đạt tới qua điều hướng bàn phím tuần tự;
    - `0` nghĩa là phần tử nên focusable và có thể đạt tới qua điều hướng bàn phím tuần tự, nhưng thứ tự tương đối được xác định bởi quy ước nền tảng;
    - một _giá trị dương_ nghĩa là phần tử nên focusable và có thể đạt tới qua điều hướng bàn phím tuần tự; thứ tự focus là theo giá trị tăng dần của `tabindex`. Nếu nhiều phần tử có cùng tabindex, thứ tự tương đối của chúng theo vị trí tương đối trong tài liệu.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("Element")}} cho phép truy vấn hầu hết các thuộc tính toàn cục.
