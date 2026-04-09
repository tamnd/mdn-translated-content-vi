---
title: Nhãn và tên văn bản
slug: Web/Accessibility/Guides/Understanding_WCAG/Text_labels_and_names
page-type: guide
sidebar: accessibilitysidebar
---

Có nhiều tình huống trong đó một điều khiển, hộp thoại, hoặc tính năng khác của website nên được cung cấp một tên hoặc nhãn mô tả để cho phép người dùng công nghệ hỗ trợ hiểu được mục đích của nó và cách vận hành nó đúng cách. Có nhiều kiểu vấn đề khác nhau trong nhóm này, xuất hiện ở các ngữ cảnh khác nhau, và mỗi loại có giải pháp riêng. Các vấn đề và giải pháp khác nhau được thảo luận trong các phần dưới đây.

## Dùng thuộc tính alt để gắn nhãn cho các phần tử area có thuộc tính href

Trong image map, hãy cho mỗi phần tử {{htmlelement("area")}} một thuộc tính `alt` chứa tên mô tả tài nguyên mà khu vực đó liên kết tới. Không làm như vậy sẽ khiến image map khó dùng đối với người dùng công nghệ hỗ trợ - họ cần văn bản thay thế để hiểu được mục đích của một hình ảnh.

### Ví dụ

Ví dụ sau cho thấy một image map (lấy từ [H24: Cung cấp văn bản thay thế cho các phần tử area của image map](https://www.w3.org/TR/WCAG20-TECHS/H24.html)):

```html
<img
  src="welcome.gif"
  usemap="#map1"
  alt="Areas in the library. Select an area for
more information on that area." />
<map id="map1" name="map1">
  <area shape="rect" coords="0,0,30,30" href="reference.html" alt="Reference" />
  <area
    shape="rect"
    coords="34,34,100,100"
    href="media.html"
    alt="Audio visual lab" />
</map>
```

Xem trang tham khảo [`<area>` element](/en-US/docs/Web/HTML/Reference/Elements/area) để có ví dụ tương tác trực tiếp.

### Xem thêm

- {{htmlelement("area")}}
- [H24: Cung cấp văn bản thay thế cho các phần tử area của image map](https://www.w3.org/TR/WCAG20-TECHS/H24.html)

## Hộp thoại nên được gắn nhãn

Với bất kỳ vùng chứa nào có nội dung hoạt động như một hộp thoại (ví dụ: hộp thoại modal yêu cầu người dùng đưa ra lựa chọn hoặc phản hồi một hành động đang được thực hiện), hãy đặt cho nó một nhãn hoặc tên mô tả, để người dùng công nghệ hỗ trợ có thể dễ dàng biết được mục đích của nó.

Hộp thoại thường được biểu thị bằng vai trò ARIA [`role="dialog"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role) hoặc [`role="alertdialog"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role); bạn có thể dùng các thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) để cung cấp nhãn.

### Ví dụ

Ví dụ sau cho thấy một hộp thoại, được định nghĩa như vậy bằng `role="dialog"` và được gắn nhãn bằng `aria-labelledby`.

```html
<div
  role="dialog"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc">
  <h2 id="dialog1Title">Your personal details were successfully updated</h2>
  <p id="dialog1Desc">
    You can change your details at any time in the user account section.
  </p>
  <button>Close</button>
</div>
```

Nếu hộp thoại không có tiêu đề, bạn có thể dùng `aria-label` để chứa văn bản nhãn:

```html
<div role="dialog" aria-label="Personal details updated confirmation">
  <p>
    Your personal details were successfully updated. You can change your details
    at any time in the user account section.
  </p>
  <button>Close</button>
</div>
```

### Xem thêm

- [`role="dialog"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
- [`role="alertdialog"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [Thực hành xây dựng hộp thoại](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/)

## Tài liệu phải có tiêu đề

Trong mỗi tài liệu HTML, điều quan trọng là phải bao gồm một phần tử {{htmlelement("title")}} mô tả mục đích của trang. Một kỹ thuật điều hướng phổ biến của người dùng công nghệ hỗ trợ là suy ra nội dung trang bằng cách đọc tiêu đề. Nếu tiêu đề không có, họ phải điều hướng qua trang để xác định nội dung, và đó có thể là một quá trình tốn thời gian và dễ gây nhầm lẫn.

### Ví dụ

Tiêu đề cho bài viết tham khảo về phần tử {{htmlelement("title")}} như sau:

```html
<title>
  &lt;title&gt;: The Document Title element - HTML: Hypertext Markup Language |
  MDN
</title>
```

Một ví dụ khác có thể trông như sau:

```html
<title>Fill in your details to register — myGov services</title>
```

Để giúp người dùng, bạn có thể cập nhật giá trị tiêu đề trang để phản ánh các thay đổi trạng thái quan trọng của trang (chẳng hạn như lỗi xác thực biểu mẫu):

```html
<title>2 errors — Fill in your details to register — myGov services</title>
```

### Xem thêm

- {{htmlelement("title")}}

## Nội dung nhúng phải được gắn nhãn

Hãy đảm bảo các phần tử nhúng nội dung có thuộc tính [title](/en-US/docs/Web/HTML/Reference/Global_attributes/title) mô tả nội dung được nhúng. Điều này bao gồm các phần tử {{htmlelement("embed")}} và {{htmlelement("object")}}. Các phần tử này thường được dùng cho nội dung đồ họa, giống như phần tử {{HTMLelement("img")}}. Một tiêu đề mô tả giúp người dùng công nghệ hỗ trợ hiểu phần tử đó đang hiển thị gì.

## Hình có chú thích tùy chọn nên được gắn nhãn

Để tốt nhất cho khả năng truy cập, hãy bao gồm một phần tử {{HTMLElement("figcaption")}} trong phần tử {{HTMLElement("figure")}}, dù về mặt kỹ thuật điều này là tùy chọn. Chú thích bổ sung cho bất kỳ văn bản thay thế nào trên các hình ảnh trong figure. Chú thích mô tả mục đích của hình trong tài liệu, điều này có thể khác với mô tả một mục trực quan, như được cung cấp bởi văn bản thay thế.

### Ví dụ

Ví dụ sau cho thấy mã cho một figure có chú thích. Thuộc tính `alt` của {{htmlelement("img")}} mô tả diện mạo của hình ảnh; {{htmlelement("figcaption")}} mô tả nó từ góc nhìn chức năng (trong trường hợp này, tên Latin của bông hoa trong ảnh).

```html
<figure>
  <img
    src="milkweed.jpg"
    alt="Black and white close-up photo of milkweed flowers" />
  <figcaption>Asclepias verticillata</figcaption>
</figure>
```

## Phần tử fieldset phải được gắn nhãn

Các phần tử fieldset phải có mô tả văn bản, tương tự các phần tử form khác. Hãy dùng phần tử {{htmlelement("legend")}} để mô tả mục đích của fieldset.

## Dùng legend để gắn nhãn cho fieldset

Khi nhóm một tập các phần tử form bằng phần tử {{htmlelement("fieldset")}}, bạn nên bao gồm một phần tử {{htmlelement("legend")}} lồng bên trong, chứa mô tả rõ ràng về nhóm.

Người dùng công nghệ hỗ trợ thấy mô tả này hữu ích khi cố gắng xác định mục đích tổng thể của nhóm. Nếu không có legend, họ sẽ phải điều hướng quanh từng điều khiển form riêng lẻ trong nhóm để suy ra mục đích chung, điều này có thể gây nhầm lẫn.

### Ví dụ

```html
<form>
  <fieldset>
    <legend>Choose your favorite monster</legend>

    <input type="radio" id="kraken" name="monster" value="K" />
    <label for="kraken">Kraken</label><br />

    <input type="radio" id="sasquatch" name="monster" value="S" />
    <label for="sasquatch">Sasquatch</label><br />

    <input type="radio" id="mothman" name="monster" value="M" />
    <label for="mothman">Mothman</label>
  </fieldset>
</form>
```

Bạn có thể xem phiên bản trực tiếp, tương tác của ví dụ này trên trang tham khảo [`<fieldset>`](/en-US/docs/Web/HTML/Reference/Elements/fieldset).

### Xem thêm

- {{htmlelement("fieldset")}}
- {{htmlelement("legend")}}

## Phần tử form phải được gắn nhãn

Tất cả phần tử trong một form phải có một {{htmlelement("label")}} xác định mục đích của nó. Điều này áp dụng cho tất cả các kiểu {{htmlelement("input")}}, cũng như các phần tử {{htmlelement("button")}}, {{htmlelement("output")}}, {{htmlelement("select")}}, {{htmlelement("textarea")}}, {{htmlelement("progress")}} và {{htmlelement("meter")}}, cũng như mọi phần tử có vai trò ARIA [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role).

Phần tử form có thể được đặt bên trong {{htmlelement("label")}}, trong trường hợp đó mối liên kết giữa phần tử form và label là hiển nhiên từ cấu trúc. Hoặc, bạn có thể tạo liên kết giữa một {{htmlelement("label")}} và phần tử form bằng cách chỉ định giá trị `id` của phần tử form làm giá trị cho thuộc tính `for` của label.

### Ví dụ

```html
<label
  >I agree to the terms and conditions.
  <input type="checkbox" id="terms" name="terms" />
</label>

<input type="checkbox" id="email-opt-in" name="opt-in" />
<label for="email-opt-in">Yes, please send me news about this product.</label>
```

## Phần tử form nên có nhãn văn bản hiển thị

Ngoài việc có một {{htmlelement("label")}} cho mỗi phần tử form, các nhãn đó nên hiển thị, không bị ẩn. Nhãn hiển thị giúp _tất cả_ người dùng hiểu mục đích của phần tử form. Đừng dựa vào văn bản placeholder, vì nó biến mất ngay khi người dùng bắt đầu nhập.

## Phần tử frame phải được gắn nhãn

Các phần tử frame, cả {{htmlelement("iframe")}} và phần tử cũ hơn, nay đã lỗi thời {{htmlelement("frame")}}, phải có một tiêu đề để mô tả nội dung của khung. Hãy dùng thuộc tính `title` để gắn nhãn cho phần tử frame. Nếu không có tiêu đề, người dùng công nghệ hỗ trợ phải điều hướng vào khung để hiểu nó chứa gì, và điều này có thể khó khăn và gây nhầm lẫn.

Phần tử {{HTMLElement('frame')}} không còn là một phần của đặc tả HTML. Hỗ trợ cho nó có thể bị các trình duyệt loại bỏ trong tương lai. Ngoài ra, trình đọc màn hình khó điều hướng các trang có phần tử {{HTMLElement('frame')}}. Để tốt nhất cho khả năng truy cập và bảo trì trong tương lai, hãy thiết kế lại bất kỳ trang nào dùng frames để dùng CSS đạt bố cục tương tự.

Như một thực hành tốt nhất, cũng nên cung cấp một {{htmlelement("title")}} cho tài liệu được chứa trong khung, với nội dung giống hệt thuộc tính `title` của khung. (Điều này giả định rằng tài liệu được chứa nằm trong quyền kiểm soát của bạn; nếu không, hãy cố gắng khớp `title` của khung với tiêu đề của tài liệu.) Một số trình đọc màn hình thay thế nội dung của thuộc tính `title` bằng nội dung của {{htmlelement("title")}} trong tài liệu được chứa. Cách an toàn và dễ tiếp cận nhất là cung cấp cùng một tiêu đề ở cả hai nơi.

### Ví dụ

```html
<iframe
  title="MDN Web docs"
  width="300"
  height="200"
  src="https://developer.mozilla.org">
</iframe>
```

## Tiêu đề phải được gắn nhãn

Hãy đảm bảo tiêu đề của bạn có nội dung văn bản không rỗng, và không bị ẩn, chẳng hạn bằng CSS `display:none` hoặc `aria-hidden=true`. Người dùng trình đọc màn hình dựa vào tiêu đề để hiểu cấu trúc và nội dung của tài liệu.

Ngoài ra, hãy đảm bảo bạn chỉ dùng [các phần tử heading](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) cho đúng vai trò tiêu đề của phần, chứ không phải như một cách tắt để làm văn bản nổi bật. Người dùng trình đọc màn hình thường "quét nhanh" các tiêu đề trên trang, tương tự người dùng nhìn thấy; văn bản không phải tiêu đề nhưng được đánh dấu bằng phần tử heading có thể gây nhầm lẫn.

## Tiêu đề nên có nội dung văn bản hiển thị

Hãy đảm bảo tiêu đề của bạn có nội dung văn bản không rỗng, và không bị ẩn, chẳng hạn bằng CSS `display:none` hoặc `aria-hidden=true`. Người dùng trình đọc màn hình dựa vào tiêu đề để hiểu cấu trúc và nội dung của tài liệu. Đừng dùng phần tử heading để đánh dấu hình ảnh hoặc nội dung đồ họa khác.

## Dùng thuộc tính title để mô tả nội dung `<iframe>`

Hãy đảm bảo các phần tử {{htmlelement("iframe")}} có thuộc tính `title` mô tả nội dung của khung. Nếu không có tiêu đề, người dùng công nghệ hỗ trợ phải điều hướng vào khung để hiểu nó chứa gì, và điều này có thể khó khăn và gây nhầm lẫn.

Như một thực hành tốt nhất, cũng nên cung cấp một {{htmlelement("title")}} cho tài liệu được chứa trong khung, với nội dung giống hệt thuộc tính `title` của khung. (Điều này giả định rằng tài liệu được chứa nằm trong quyền kiểm soát của bạn; nếu không, hãy cố gắng khớp `title` của khung với tiêu đề của tài liệu.) Một số trình đọc màn hình thay thế nội dung của thuộc tính `title` bằng nội dung của {{htmlelement("title")}} trong tài liệu được chứa. Cách an toàn và dễ tiếp cận nhất là cung cấp cùng một tiêu đề ở cả hai nơi.

## Nội dung có hình ảnh phải được gắn nhãn

Cung cấp văn bản mô tả cho tất cả hình ảnh có nội dung thực sự (nghĩa là không phải trang trí) và các phần tử giống hình ảnh. Điều này bao gồm hình SVG, {{htmlelement("img")}}, {{htmlelement("canvas")}}, {{htmlelement("map")}}, và {{htmlelement("area")}}, cũng như các phần tử {{htmlelement("input")}} có `type=image` và các phần tử {{htmlelement("object")}} có `type` bắt đầu bằng `image/`. Cách thông thường để làm điều này là dùng thuộc tính `alt`, nhưng với các phần tử không cho phép `alt`, như {{htmlelement("canvas")}}, hãy dùng [`role="img"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role) và [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) thay vào đó. Hãy đảm bảo mô tả truyền đạt đúng những gì được hiển thị trong hình.

Đối với thuộc tính `alt` trên hình ảnh _thuần trang trí_, có thể dùng giá trị rỗng để báo cho công cụ truy cập rằng phần tử nên bị bỏ qua.

### Ví dụ

```html
<img
  src="milkweed.jgp"
  alt="Black and white close-up photo of milkweed flowers" />
```

## Phần tử tương tác phải được gắn nhãn

Nếu một phần tử được dùng để người dùng tương tác, nó nên có nhãn. Các phần tử tương tác bao gồm liên kết ({{htmlelement("a")}}), phần tử form, nút, và bất kỳ phần tử nào có trình xử lý cho sự kiện chuột hoặc bàn phím. Cách gắn nhãn cho phần tử phụ thuộc vào loại của nó: với phần tử form, hãy dùng một {{htmlelement("label")}}; với liên kết, nút và phần tử có thể nhấp, nội dung văn bản của phần tử thường cung cấp nhãn. Nếu không còn lựa chọn nào khác để gắn nhãn cho một phần tử, hãy dùng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

## Dùng thuộc tính label trên phần tử optgroup

Trong phần tử {{htmlelement("optgroup")}}, hãy dùng thuộc tính `label` để mô tả nhóm, ताकि công nghệ hỗ trợ có thể truy cập nó cho người dùng của mình.

### Ví dụ

Trong ví dụ này, thuộc tính `label` trên các phần tử {{HTMLElement('optgroup')}} cung cấp tên danh mục cho nhóm tùy chọn.

```html
<label for="dino-select">Choose a dinosaur:</label>
<select id="dino-select">
  <optgroup label="Theropods">
    <option>Tyrannosaurus</option>
    <option>Velociraptor</option>
    <option>Deinonychus</option>
  </optgroup>
  <optgroup label="Sauropods">
    <option>Diplodocus</option>
    <option>Saltasaurus</option>
    <option>Apatosaurus</option>
  </optgroup>
</select>
```

## Toolbar phải được gắn nhãn khi có nhiều hơn một toolbar

Nếu bạn định nghĩa nhiều hơn một toolbar trong một ứng dụng web dùng vai trò ARIA `toolbar`, bạn phải dùng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) để gắn nhãn cho từng toolbar ताकि nó có thể được công nghệ hỗ trợ mô tả. Việc gắn nhãn cho toolbar là thực hành tốt, ngay cả khi trên mỗi trang chỉ có một toolbar.

### Xem thêm

- [Ví dụ toolbar của W3C ARIA](https://www.w3.org/WAI/ARIA/apg/patterns/toolbar/examples/toolbar/)

## Các tiêu chí thành công WCAG liên quan

- [1.1.1 Non-text Content (A)](https://w3c.github.io/wcag/guidelines/22/#non-text-content)
  - : Tất cả nội dung không phải văn bản được trình bày cho người dùng đều có một văn bản thay thế phục vụ mục đích tương đương, ngoại trừ các tình huống được liệt kê trong liên kết ở trên.
- [2.4.4 Link Purpose (In Context) (A)](https://w3c.github.io/wcag/guidelines/22/#link-purpose-in-context)
  - : Mục đích của mỗi liên kết có thể được xác định chỉ từ văn bản liên kết hoặc từ văn bản liên kết cùng ngữ cảnh liên kết được xác định theo chương trình, ngoại trừ khi mục đích của liên kết sẽ mơ hồ với người dùng nói chung.
- [2.4.9 Link Purpose (Link Only) (AAA)](https://w3c.github.io/wcag/guidelines/22/#link-purpose-link-only)
  - : Có một cơ chế cho phép xác định mục đích của mỗi liên kết chỉ từ văn bản liên kết, ngoại trừ khi mục đích của liên kết sẽ mơ hồ với người dùng nói chung.
