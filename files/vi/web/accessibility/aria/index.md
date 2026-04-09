---
title: ARIA
slug: Web/Accessibility/ARIA
page-type: landing-page
sidebar: accessibilitysidebar
---

Accessible Rich Internet Applications **(<abbr>ARIA</abbr>)** là một tập hợp các [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) và [thuộc tính](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes) định nghĩa các cách giúp nội dung web và ứng dụng web, đặc biệt là những nội dung được phát triển bằng JavaScript, dễ tiếp cận hơn với người khuyết tật.

ARIA bổ sung cho HTML để các tương tác và widget thường dùng trong ứng dụng có thể được chuyển tới công nghệ hỗ trợ khi bản thân HTML không có cơ chế phù hợp. Ví dụ, ARIA cho phép tạo widget JavaScript có trợ năng, gợi ý biểu mẫu và thông báo lỗi, cập nhật nội dung động, cùng nhiều khả năng khác.

## Trước khi dùng ARIA

> [!WARNING]
> Nhiều widget trong số này đã được hỗ trợ đầy đủ trong các trình duyệt hiện đại. **Nhà phát triển nên ưu tiên dùng phần tử HTML ngữ nghĩa phù hợp thay vì dùng ARIA**, nếu phần tử đó đã tồn tại. Ví dụ, phần tử gốc đã có sẵn [khả năng truy cập bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets), vai trò và trạng thái. Tuy nhiên, nếu bạn chọn dùng ARIA, bạn phải tự chịu trách nhiệm mô phỏng hành vi tương đương của trình duyệt bằng script.

[Quy tắc đầu tiên của việc dùng ARIA](https://w3c.github.io/using-aria/#rule1) là: "Nếu bạn có thể dùng một phần tử hoặc thuộc tính HTML gốc đã có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy."

> [!NOTE]
> Có một câu nói rằng "Không ARIA còn tốt hơn ARIA tệ". Trong [khảo sát hơn một triệu trang chủ của WebAim](https://webaim.org/projects/million/#aria), họ nhận thấy rằng các trang chủ có ARIA xuất hiện trung bình có nhiều lỗi được phát hiện hơn 41% so với các trang không có ARIA. Dù ARIA được thiết kế để làm cho trang web dễ tiếp cận hơn, nếu dùng sai, nó có thể gây hại nhiều hơn lợi.

Dưới đây là markup cho một widget thanh tiến trình:

```html
<div
  id="percent-loaded"
  role="progressbar"
  aria-valuenow="75"
  aria-valuemin="0"
  aria-valuemax="100"></div>
```

Thanh tiến trình này được xây dựng bằng {{HTMLElement("div")}}, vốn không mang ý nghĩa ngữ nghĩa. Chúng ta thêm vai trò và thuộc tính ARIA để bổ sung ý nghĩa. Trong ví dụ này, thuộc tính [`role="progressbar"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role) thông báo cho trình duyệt rằng phần tử này thực chất là một widget thanh tiến trình chạy bằng JavaScript. Các thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) và [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) chỉ định giá trị tối thiểu và tối đa cho thanh tiến trình, còn [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) mô tả trạng thái hiện tại của nó và vì vậy phải được cập nhật bằng JavaScript.

Ngoài việc đặt trực tiếp trong markup, các thuộc tính ARIA cũng có thể được thêm vào phần tử và cập nhật động bằng mã JavaScript như sau:

```js
// Find the progress bar <div> in the DOM.
const progressBar = document.getElementById("percent-loaded");

// Set its ARIA roles and states,
// so that assistive technologies know what kind of widget it is.
progressBar.setAttribute("role", "progressbar");
progressBar.setAttribute("aria-valuemin", 0);
progressBar.setAttribute("aria-valuemax", 100);

// Create a function that can be called at any time to update
// the value of the progress bar.
function updateProgress(percentComplete) {
  progressBar.setAttribute("aria-valuenow", percentComplete);
}
```

Mọi nội dung dành cho người dùng không sử dụng công nghệ hỗ trợ đều phải được cung cấp cho công nghệ hỗ trợ. Tương tự, không nên có tính năng nào chỉ dành riêng cho người dùng công nghệ hỗ trợ mà lại không thể truy cập được với những người không dùng công nghệ hỗ trợ. Thanh tiến trình ở trên cũng cần được tạo kiểu để trông giống một thanh tiến trình thực sự.

Sẽ đơn giản hơn nhiều nếu dùng phần tử gốc {{HTMLElement('progress')}}:

```html
<progress id="percent-loaded" value="75" max="100">75 %</progress>
```

> [!NOTE]
> Thuộc tính `min` không được phép dùng với phần tử {{HTMLElement('progress')}}; giá trị tối thiểu của nó luôn là `0`.

> [!NOTE]
> Các phần tử landmark HTML ({{HTMLElement("main")}}, {{HTMLElement("header")}}, {{HTMLElement("nav")}}, v.v.) đã có sẵn vai trò ARIA ngầm định, nên không cần lặp lại chúng.

## Hỗ trợ

Giống như các công nghệ web khác, ARIA có mức độ hỗ trợ khác nhau. Mức hỗ trợ phụ thuộc vào hệ điều hành và trình duyệt đang được sử dụng, cũng như loại công nghệ hỗ trợ tương tác với nó. Ngoài ra, phiên bản của hệ điều hành, trình duyệt và công nghệ hỗ trợ cũng là những yếu tố ảnh hưởng. Các phiên bản phần mềm cũ hơn có thể không hỗ trợ một số vai trò ARIA nhất định, chỉ hỗ trợ một phần, hoặc báo sai chức năng của chúng.

Điều quan trọng nữa là cần thừa nhận rằng một số người phụ thuộc vào công nghệ hỗ trợ thường ngần ngại nâng cấp phần mềm vì lo mất khả năng tương tác với máy tính và trình duyệt của họ. Vì vậy, cần [dùng các phần tử HTML ngữ nghĩa](/en-US/docs/Learn_web_development/Core/Accessibility/HTML) bất cứ khi nào có thể, vì HTML ngữ nghĩa có mức hỗ trợ với công nghệ hỗ trợ tốt hơn nhiều.

Điều quan trọng nữa là phải kiểm thử ARIA mà bạn viết bằng các công nghệ hỗ trợ thực tế. Đó là vì các trình giả lập hoặc mô phỏng trình duyệt không thực sự hiệu quả trong việc kiểm thử hỗ trợ đầy đủ. Tương tự, các giải pháp công nghệ hỗ trợ kiểu proxy cũng không đủ để bảo đảm hoàn toàn chức năng.

## Tài liệu tham khảo

[Tài liệu tham khảo ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference) là một danh sách đầy đủ các thuộc tính và vai trò ARIA được ghi nhận trên MDN.

- [Vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
  - : Vai trò ARIA có thể được dùng để mô tả những phần tử vốn không tồn tại sẵn trong HTML hoặc có tồn tại nhưng chưa được hỗ trợ rộng rãi trong trình duyệt.
- [Trạng thái và thuộc tính ARIA (attributes)](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes)
  - : Các thuộc tính ARIA cho phép thay đổi trạng thái và thuộc tính của phần tử như được định nghĩa trong cây trợ năng.

## Hướng dẫn

[Các hướng dẫn ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides) là những tài nguyên giúp bạn cải thiện trợ năng của các tính năng trên trang web như bảng, biểu mẫu và điều hướng bằng bàn phím.

## Các nỗ lực chuẩn hóa

- [Đặc tả WAI-ARIA](https://w3c.github.io/aria/)
  - : Chính đặc tả của W3C.
- [Thực hành biên soạn WAI-ARIA](https://www.w3.org/WAI/ARIA/apg/)
  - : Các tài liệu thực hành tốt nhất chính thức về cách áp dụng ARIA cho các widget và tương tác phổ biến. Đây là một tài nguyên rất hữu ích.

## ARIA cho widget có script

- [Viết widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets)
  - : Các phần tử có sẵn như {{HTMLElement("input")}}, {{HTMLElement("button")}}, v.v. vốn đã có khả năng truy cập bằng bàn phím. Nếu bạn "giả lập" chúng bằng {{HTMLElement("div")}} và ARIA, bạn phải bảo đảm widget của mình có thể truy cập được bằng bàn phím.
- [Live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
  - : Live region cung cấp gợi ý cho trình đọc màn hình về cách xử lý các thay đổi trong nội dung của một trang.

## Video

Những bài nói chuyện sau đây là cách rất tốt để hiểu về ARIA:

[ARIA, Accessibility APIs and coding like you give a damn! – Léonie Watson](https://www.youtube.com/watch?v=qdB8SRhqvFc)
