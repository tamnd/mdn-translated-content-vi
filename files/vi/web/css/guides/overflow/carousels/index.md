---
title: Creating CSS carousels
short-title: Creating carousels
slug: Web/CSS/Guides/Overflow/Carousels
page-type: guide
sidebar: cssref
---

Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) định nghĩa các tính năng cho phép tạo carousel thuần CSS linh hoạt với scroll button và scroll marker được trình duyệt tạo sẵn và nhà phát triển tạo kiểu. Hướng dẫn này giải thích cách tạo carousel sử dụng các tính năng này.

## Khái niệm carousel

**Carousel** là một tính năng phổ biến trên web. Chúng thường có dạng một vùng nội dung có thể cuộn chứa nhiều mục, chẳng hạn như slide thuyết trình, quảng cáo, tin tức tiêu đề, hoặc các tính năng sản phẩm chính.

Người dùng có thể di chuyển qua các mục bằng cách nhấp hoặc kích hoạt các nút điều hướng hoặc bằng cách vuốt. Điều hướng thường bao gồm:

- **scroll button**
  - : Thông thường là các nút hoặc liên kết "trước" và "sau".
- **scroll marker**
  - : Một loạt các biểu tượng nút hoặc liên kết, mỗi cái đại diện cho một hoặc nhiều mục tùy thuộc vào số mục được hiển thị ở mỗi vị trí cuộn trong carousel.

![Một carousel với vùng nội dung ở giữa, nút trước và sau bên trái và bên phải, và scroll marker ở phía dưới](/shared-assets/images/diagrams/css/carousels/carousel.svg)

Một tính năng quan trọng của carousel là **phân trang** — các mục có cảm giác như các nội dung riêng biệt được chuyển qua lại thay vì tạo thành một phần nội dung liên tục. Bạn có thể hiển thị một mục tại một thời điểm hoặc nhiều mục trên mỗi "trang" carousel. Khi hiển thị nhiều mục, bạn có thể hiển thị hoàn toàn một nhóm mục mới mỗi lần nhấn nút "sau" hoặc "trước". Ngoài ra, bạn có thể thêm một mục mới vào một đầu danh sách trong khi di chuyển mục ở đầu kia ra khỏi tầm nhìn.

Carousel có thể khá dễ vỡ và khó triển khai bằng JavaScript. Chúng yêu cầu các script để liên kết scroll marker với các mục chúng đại diện trong khi liên tục cập nhật scroll button để chúng hoạt động chính xác.

May mắn thay, chúng ta có thể tạo carousel với các điều khiển liên quan mà không cần JavaScript, sử dụng các tính năng CSS carousel.

## Tính năng CSS carousel

Các tính năng CSS carousel cung cấp pseudo-element và pseudo-class cho phép tạo carousel chỉ bằng CSS và HTML, với trình duyệt xử lý hầu hết các tham chiếu cuộn và liên kết theo cách linh hoạt và nhất quán. Các tính năng này như sau:

- {{cssxref("::scroll-button()")}}
  - : Được tạo bên trong {{glossary("scroll container")}}, các pseudo-element này đại diện cho scroll button, cuộn container theo một hướng được chỉ định.
- {{cssxref("::scroll-marker-group")}}
  - : Được tạo bên trong scroll container; dùng để tập hợp và bố trí các scroll marker.
- {{cssxref("::scroll-marker")}}
  - : Được tạo bên trong các phần tử con của tổ tiên scroll container hoặc bên trong các cột của scroll container, để đại diện cho scroll marker của chúng. Chúng có thể được chọn để cuộn container đến phần tử con hoặc cột liên quan, và được thu thập vào {{cssxref("::scroll-marker-group")}} của scroll container tổ tiên để bố trí.
- {{cssxref(":target-current")}}
  - : Dùng để chọn scroll marker đang hoạt động và tạo kiểu cho nó. Khả năng tạo kiểu cho scroll marker đang hoạt động rất quan trọng cho cả khả năng sử dụng và khả năng tiếp cận.
- {{cssxref(":target-before")}} và {{cssxref(":target-after")}}
  - : Dùng để chọn và tạo kiểu cho các scroll marker trước và sau scroll marker đang hoạt động. Chúng hữu ích để tạo kiểu cho các mục điều hướng đứng trước và sau vị trí điều hướng đang hoạt động, cho biết các mục người dùng đã xem và những mục còn lại.
- {{cssxref("::column")}}
  - : Đại diện cho các cột riêng lẻ được tạo ra khi container được đặt để hiển thị nội dung theo nhiều cột thông qua [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout). Pseudo-element `::column` có thể được sử dụng kết hợp với {{cssxref("::scroll-marker")}} để tạo scroll marker cho mỗi cột.

## Carousel với trang đơn

Demo đầu tiên là carousel với trang đơn, mỗi mục chiếm toàn bộ trang. Chúng ta có [scroll marker](#creating_scroll_markers) làm điều hướng phía dưới và [scroll button](#creating_scroll_buttons) ở hai bên trang, cho phép người dùng di chuyển đến trang trước và sau.

Chúng ta sẽ sử dụng [flexbox](#carousel_layout_with_flexbox) để bố trí carousel, [scroll snapping](#setting_up_scroll_snapping_on_the_list) để thực thi phân trang rõ ràng, và anchor positioning để [định vị scroll button](#positioning_scroll_buttons) và scroll marker tương đối với carousel.

HTML bao gồm một [phần tử tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) và một [danh sách không có thứ tự](/en-US/docs/Web/HTML/Reference/Elements/ul), trong đó mỗi [mục danh sách](/en-US/docs/Web/HTML/Reference/Elements/li) chứa một số nội dung mẫu, cùng với thuộc tính `data-` tùy chỉnh (được giải thích kèm theo phần tạo kiểu):

```html live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
<h1>CSS carousel single item per page</h1>
<ul>
  <li data-accName="Item 1">
    <h2>Page 1</h2>
  </li>
  <li data-accName="Item 2">
    <h2>Page 2</h2>
  </li>
  <li data-accName="Item 3">
    <h2>Page 3</h2>
  </li>
  <li data-accName="Item 4">
    <h2>Page 4</h2>
  </li>
</ul>
```

### Bố trí carousel với flexbox

Chúng ta sử dụng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) để tạo một hàng mục đơn; `<ul>` là flex container, và các mục danh sách `<li>` con được hiển thị theo chiều ngang với mỗi mục chiếm toàn bộ chiều rộng của carousel.

Danh sách không có thứ tự được đặt để lấp đầy chiều rộng toàn bộ viewport với {{cssxref("width")}} là `100vw`; nó cũng được đặt {{cssxref("height")}} là `300px` và một số {{cssxref("padding")}}. Chúng ta sau đó sử dụng flexbox để bố trí danh sách — đặt giá trị {{cssxref("display")}} là `flex` để khiến các mục danh sách con hiển thị theo hàng (do giá trị mặc định {{cssxref("flex-direction")}} là `row`), với {{cssxref("gap")}} là `4vw` giữa mỗi mục.

```css hidden live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  text-align: center;
  font-size: 1.7rem;
}
```

```css live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
ul {
  width: 100vw;
  height: 300px;
  padding: 20px;
  display: flex;
  gap: 4vw;
}
```

Bây giờ đến lúc tạo kiểu cho các mục danh sách. Các khai báo đầu tiên cung cấp kiểu dáng cơ bản. Khai báo quan trọng là giá trị {{cssxref("flex")}} là `0 0 100%`, buộc mỗi mục rộng bằng container (`<ul>`). Kết quả là nội dung sẽ tràn ra ngoài container, và viewport sẽ cuộn theo chiều ngang.

```css live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
li {
  list-style-type: none;
  background-color: #eeeeee;
  border: 1px solid #dddddd;
  padding: 20px;

  flex: 0 0 100%;
}

li:nth-child(even) {
  background-color: cyan;
}
```

Ngoài ra, mỗi mục danh sách chẵn được gán màu nền khác thông qua {{cssxref(":nth-child()")}}, để dễ nhìn thấy hiệu ứng cuộn hơn.

### Thiết lập scroll snapping cho danh sách

Trong phần này, chúng ta sẽ đặt giá trị overflow cho `<ul>` để biến nó thành {{glossary("scroll container")}}, sau đó áp dụng [CSS scroll snapping](/en-US/docs/Web/CSS/Guides/Scroll_snap) để khiến danh sách snap vào tâm của mỗi mục khi cuộn nội dung.

Giá trị {{cssxref("overflow-x")}} là `scroll` được đặt cho `<ul>` để nội dung của nó cuộn theo chiều ngang bên trong danh sách, thay vì toàn bộ viewport cuộn. [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) sau đó được sử dụng để snap vào từng "trang" — giá trị {{cssxref("scroll-snap-type")}} là `x mandatory` được đặt để biến danh sách thành [scroll snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container). Từ khóa `x` khiến các [snap target](/en-US/docs/Glossary/Scroll_snap#snap_target) của container được snap theo chiều ngang, trong khi từ khóa `mandatory` có nghĩa là container sẽ luôn snap vào snap target khi kết thúc hành động cuộn.

```css live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
ul {
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
}
```

Tiếp theo, giá trị {{cssxref("scroll-snap-align")}} là `center` được đặt cho các mục danh sách để khi danh sách được cuộn, nó snap vào tâm của mỗi mục.

```css live-sample___first-example live-sample___first-example-step1 live-sample___first-example-step2
li {
  scroll-snap-align: center;
}
```

Đoạn code trên được hiển thị như sau:

{{EmbedLiveSample("first-example-step1", "100%", "400px")}}

Thử cuộn danh sách bằng cách vuốt hoặc sử dụng thanh cuộn để xem hiệu ứng scroll snapping. Dù bạn kết thúc chuyển động cuộn ở đâu, một mục sẽ luôn "snap" vào vị trí.

> [!NOTE]
> CSS scroll snapping không bắt buộc khi sử dụng các tính năng CSS carousel. Tuy nhiên, carousel hoạt động tốt hơn nhiều khi có scroll snapping. Không có scroll snapping, scroll button và marker sẽ khó điều hướng giữa các trang một cách gọn gàng, và kết quả sẽ kém chất lượng.

### Tạo scroll button

Trong phần này, chúng ta thêm scroll button "trước" và "sau" vào demo để cung cấp công cụ điều hướng giữa các trang carousel. Điều này được thực hiện bằng pseudo-element {{cssxref("::scroll-button()")}}.

Các pseudo-element `::scroll-button()` tạo ra các nút bên trong scroll container chỉ khi các thuộc tính {{cssxref("content")}} của chúng được đặt thành giá trị khác `none`. Mỗi `::scroll-button()` đại diện cho một scroll button, hướng cuộn được chỉ định bởi tham số của selector. Bạn có thể tạo tối đa bốn scroll button mỗi scroll container, mỗi nút cuộn nội dung container về phía đầu hoặc cuối của trục block hoặc inline.

Bạn cũng có thể chỉ định tham số `*` để nhắm đến tất cả các pseudo-element `::scroll-button()` với các style.

Trước tiên, tất cả scroll button được nhắm đến với một số style cơ bản, cũng như tạo kiểu dựa trên các trạng thái khác nhau. Điều quan trọng là đặt style {{cssxref(":focus")}} cho người dùng sử dụng bàn phím. Ngoài ra, vì scroll button tự động được đặt thành [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) khi không thể cuộn thêm theo hướng đó, chúng ta sử dụng pseudo-class {{cssxref(":disabled")}} để nhắm đến trạng thái này.

```css live-sample___first-example live-sample___first-example-step2
ul::scroll-button(*) {
  border: 0;
  font-size: 2rem;
  background: none;
  color: black;
  opacity: 0.7;
  cursor: pointer;
}

ul::scroll-button(*):hover,
ul::scroll-button(*):focus {
  opacity: 1;
}

ul::scroll-button(*):active {
  translate: 1px 1px;
}

ul::scroll-button(*):disabled {
  opacity: 0.2;
  cursor: unset;
}
```

> [!NOTE]
> Chúng ta cũng đặt giá trị {{cssxref("cursor")}} là `pointer` cho scroll button để làm rõ hơn rằng chúng có thể được tương tác (cải thiện cả [UX](/en-US/docs/Glossary/UX) chung và [cognitive accessibility](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility)), hủy đặt khi scroll button ở trạng thái `:disabled`.

Tiếp theo, một biểu tượng thích hợp được đặt cho scroll button trái và phải thông qua thuộc tính {{cssxref("content")}}, đây cũng là thứ khiến scroll button được tạo ra. Biểu tượng đó cũng phải có tên tiếp cận (accessible name) dạng văn bản thuần, vì vậy hãy sử dụng tính năng [alternative text](/en-US/docs/Web/CSS/Reference/Properties/content#adding_an_image_with_alternative_text) của thuộc tính `content` (với lưu ý rằng [điều này vẫn có thể không đủ để đáp ứng WCAG](/en-US/docs/Web/CSS/Reference/Properties/content#accessibility)):

```css live-sample___first-example live-sample___first-example-step2
ul::scroll-button(left) {
  content: "◄" / "Previous";
}

ul::scroll-button(right) {
  content: "►" / "Next";
}
```

> [!NOTE]
> User agent nên tự động cung cấp tên tiếp cận thích hợp cho scroll button được tạo ra để công nghệ hỗ trợ có thể thông báo chúng phù hợp và các nút nên có [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) ngầm định là `button`. Cung cấp [alternative text cho generated content](/en-US/docs/Web/CSS/Reference/Properties/content#alternative_text_string_counter_attr) đảm bảo các nút có {{glossary("accessible name", "accessible name")}} là "scroll left" và "scroll right" trong các user agent không có sẵn tính năng tiếp cận scroll button.

### Định vị scroll button

Chúng ta đã tạo scroll button. Bây giờ chúng ta sẽ định vị chúng tương đối với carousel sử dụng [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning).

Trước tiên, một {{cssxref("anchor-name")}} tham chiếu được đặt trên danh sách. Tiếp theo, mỗi scroll button có {{cssxref("position")}} được đặt thành `absolute`, và thuộc tính {{cssxref("position-anchor")}} được đặt thành cùng tên tham chiếu được định nghĩa trên danh sách, để liên kết hai cái lại với nhau.

```css live-sample___first-example live-sample___first-example-step2
ul {
  anchor-name: --my-carousel;
}

ul::scroll-button(*) {
  position: absolute;
  position-anchor: --my-carousel;
}
```

Để thực sự định vị mỗi scroll button, chúng ta đặt giá trị cho {{glossary("inset properties")}} của chúng. Chúng ta sử dụng hàm {{cssxref("anchor()")}} để định vị các cạnh được chỉ định của các nút tương đối với các cạnh của carousel. Trong mỗi trường hợp, hàm {{cssxref("calc()")}} được dùng để thêm một khoảng cách giữa cạnh nút và cạnh carousel. Ví dụ, cạnh phải của scroll button trái được định vị 70 pixel về bên phải của cạnh trái carousel.

```css live-sample___first-example live-sample___first-example-step2
ul::scroll-button(left) {
  right: calc(anchor(left) - 70px);
  bottom: calc(anchor(top) + 13px);
}

ul::scroll-button(right) {
  left: calc(anchor(right) - 70px);
  bottom: calc(anchor(top) + 13px);
}
```

Thêm vào đoạn code scroll button, chúng ta có kết quả sau:

{{EmbedLiveSample("first-example-step2", "100%", "400px")}}

Thử nhấn scroll button "trước" và "sau" để xem cách các trang được cuộn, tôn trọng hành vi scroll snapping. Cũng lưu ý cách nút "trước" tự động bị vô hiệu hóa khi danh sách được cuộn đến đầu nội dung, trong khi nút "sau" tự động bị vô hiệu hóa khi danh sách được cuộn đến cuối nội dung.

### Tạo scroll marker

Scroll marker là một nhóm nút, mỗi nút cuộn carousel đến vị trí liên quan đến một trong các trang nội dung. Chúng cung cấp công cụ điều hướng bổ sung cũng cho biết tiến trình của bạn qua các trang carousel.

Trong phần này, chúng ta sẽ thêm scroll marker vào carousel, liên quan đến ba tính năng chính:

- Thuộc tính {{cssxref("scroll-marker-group")}} được đặt trên phần tử scroll container. Nó cần được đặt thành giá trị khác `none` để pseudo-element {{cssxref("::scroll-marker-group")}} được tạo ra; giá trị của nó chỉ định vị trí scroll marker group xuất hiện trong tab order của carousel và thứ tự hộp layout (nhưng không phải cấu trúc DOM) — `before` đặt nó ở đầu, trước scroll button, trong khi `after` đặt nó ở cuối.
- Pseudo-element {{cssxref("::scroll-marker-group")}} tồn tại bên trong scroll container, và được dùng để tập hợp, chứa và bố trí scroll marker như một nhóm tổng thể.
- Pseudo-element {{cssxref("::scroll-marker")}} tồn tại bên trong các phần tử con và fragment {{cssxref("::column")}} của tổ tiên scroll container, và đại diện cho scroll marker của chúng. Chúng được thu thập vào {{cssxref("::scroll-marker-group")}} của tổ tiên để bố trí.

Để bắt đầu, thuộc tính `scroll-marker-group` của danh sách được đặt thành `after`, để pseudo-element `::scroll-marker-group` được đặt sau nội dung DOM của danh sách theo thứ tự focus và hộp layout; điều này có nghĩa là nó đứng sau scroll button:

```css live-sample___first-example
ul {
  scroll-marker-group: after;
}
```

> [!NOTE]
> Ngoài ra, một scroll marker group container có thể được tạo từ một phần tử hiện có chứa một tập hợp các phần tử {{htmlelement("a")}} sử dụng {{cssxref("scroll-target-group")}}.

Tiếp theo, pseudo-element `::scroll-marker-group` của danh sách được định vị tương đối với carousel sử dụng CSS anchor positioning, tương tự như scroll button, ngoại trừ nó được căn giữa theo chiều ngang trên carousel sử dụng giá trị {{cssxref("justify-self")}} là `anchor-center`. Nhóm được bố trí bằng flexbox, với giá trị {{cssxref("justify-content")}} là `center` và {{cssxref("gap")}} là `20px` để các phần tử con của nó (pseudo-element `::scroll-marker`) được căn giữa bên trong `::scroll-marker-group` với khoảng cách giữa mỗi cái.

```css live-sample___first-example
ul::scroll-marker-group {
  position: absolute;
  position-anchor: --my-carousel;
  top: calc(anchor(bottom) - 70px);
  justify-self: anchor-center;

  display: flex;
  justify-content: center;
  gap: 20px;
}
```

Tiếp theo, chúng ta xử lý giao diện và cảm giác của bản thân scroll marker; chúng có thể được tạo kiểu giống như bất kỳ [generated content](/en-US/docs/Web/CSS/Guides/Generated_content) nào khác. Điều quan trọng cần lưu ý là chúng ta cần đặt giá trị khác `none` cho thuộc tính `content` để scroll marker thực sự được tạo ra. Giá trị `""` tạo ra accessible name trống (vi phạm WCAG SC [4.1.2 Name, Role, Value](https://www.w3.org/WAI/WCAG22/Understanding/name-role-value.html)), vì vậy cần cung cấp một giá trị văn bản. Vì mỗi scroll marker có cùng tên có thể không hữu ích cho người dùng, hãy cân nhắc sử dụng `attr()` để lấy giá trị từ thuộc tính `data-` tùy chỉnh trên `<li>` (ví dụ này tìm kiếm thuộc tính `data-accName`). Lưu ý rằng giá trị này sẽ không được dịch bởi các dịch vụ dịch tự động.

Chúng ta cũng đặt một số style cơ bản để làm cho các marker xuất hiện như các vòng tròn có viền trong khi ẩn nội dung văn bản đã thêm về mặt trực quan:

```css live-sample___first-example
li::scroll-marker {
  content: attr(data-accName);
  width: 16px;
  height: 16px;
  background-color: transparent;
  border: 2px solid black;
  border-radius: 50%;
  overflow: hidden;
  text-indent: 16px;
}
```

> [!NOTE]
> Generated content là inline theo mặc định; chúng ta có thể áp dụng `width` và `height` cho scroll marker của mình vì chúng đang được bố trí như flex item.

Cuối cùng cho phần này, pseudo-class {{cssxref(":target-current")}} được dùng để chọn scroll marker nào tương ứng với "trang" đang hiển thị, làm nổi bật tiến trình cuộn của người dùng qua nội dung. Trong trường hợp này, chúng ta đặt `background-color` thành `black` để nó được tạo kiểu như một vòng tròn được tô đầy.

```css live-sample___first-example
li::scroll-marker:target-current {
  background-color: black;
}
```

> [!NOTE]
> Khi một scroll marker group container được tạo trên scroll container sử dụng thuộc tính `scroll-marker-group`, scroll container được hiển thị với ngữ nghĩa [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)/[`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role). Bạn có thể dùng <kbd>Tab</kbd> để đến nó bằng bàn phím, sau đó di chuyển giữa các "trang" khác nhau sử dụng phím con trỏ trái và phải (hoặc trên và dưới), cũng thay đổi trạng thái của scroll marker và scroll button liên quan như mong đợi. Các scroll marker cũng có thể được nhảy giữa bình thường, như mong đợi.

## Kết quả cuối cùng của carousel trang đơn

Tất cả code trên kết hợp tạo ra kết quả sau:

{{EmbedLiveSample("first-example", "100%", "400px")}}

So với live example trước, scroll marker đã được thêm vào — thử nhấn chúng để nhảy thẳng đến mỗi trang. Lưu ý cách marker hiện tại được làm nổi bật để bạn có thể thấy vị trí của mình trong phân trang. Cũng thử dùng Tab đến nhóm scroll marker, sau đó sử dụng phím con trỏ để chuyển qua từng trang.

Bạn cũng có thể điều hướng giữa các trang bằng cách vuốt trái và phải, kéo thanh cuộn, hoặc nhấn scroll button.

## Carousel responsive: nhiều mục trên mỗi trang

Demo thứ hai là carousel với nhiều mục trên mỗi trang, cũng bao gồm [scroll button](#creating_scroll_buttons) và [scroll marker](#creating_scroll_markers) để điều hướng qua các trang. Demo này cũng responsive — số lượng mục khác nhau xuất hiện trên mỗi trang tùy thuộc vào chiều rộng viewport.

Demo này rất tương tự với demo [Carousel với trang đơn](#carousel_with_single_pages), ngoại trừ thay vì sử dụng flexbox để bố trí, nó sử dụng [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout) và pseudo-element {{cssxref("::column")}} để tạo ra các cột tùy ý trải dài toàn bộ chiều rộng carousel và có thể chứa nhiều mục.

> [!NOTE]
> Hiện tại không có cách nào để cung cấp accessible name cho scroll marker (không có phần tử HTML tương ứng để lấy giá trị `data-` như trong ví dụ trước). Sử dụng pattern này sẽ tạo ra vi phạm WCAG SC [4.1.2 Name, Role, Value](https://www.w3.org/WAI/WCAG22/Understanding/name-role-value.html).

Sử dụng cách tiếp cận này, chúng ta có thể chắc chắn rằng nếu viewport tăng hoặc giảm, trong khi kích thước mục vẫn không đổi, chúng ta sẽ không bao giờ có mục một phần hiển thị ngoài rìa scrollport. Trong trường hợp này, scroll marker được tạo ra trên fragment scroll container, theo cột, thay vì trên phần tử con, theo mục.

HTML rất tương tự với demo trước, ngoại trừ có nhiều mục danh sách hơn đáng kể và vì nhiều mục sẽ hiển thị cùng lúc, chúng ta đặt nhãn cho chúng là item thay vì page:

```html-nolint
...
  <li>
    <h2>Item 1</h2>
  </li>
...
```

Demo này cũng có CSS rất tương tự, ngoại trừ các quy tắc được giải thích trong các phần sau.

```html hidden live-sample___second-example
<h1>CSS carousel multiple items per page</h1>
<ul>
  <li>
    <h2>Item 1</h2>
  </li>
  <li>
    <h2>Item 2</h2>
  </li>
  <li>
    <h2>Item 3</h2>
  </li>
  <li>
    <h2>Item 4</h2>
  </li>
  <li>
    <h2>Item 5</h2>
  </li>
  <li>
    <h2>Item 6</h2>
  </li>
  <li>
    <h2>Item 7</h2>
  </li>
  <li>
    <h2>Item 8</h2>
  </li>
  <li>
    <h2>Item 9</h2>
  </li>
  <li>
    <h2>Item 10</h2>
  </li>
  <li>
    <h2>Item 11</h2>
  </li>
  <li>
    <h2>Item 12</h2>
  </li>
  <li>
    <h2>Item 13</h2>
  </li>
  <li>
    <h2>Item 14</h2>
  </li>
  <li>
    <h2>Item 15</h2>
  </li>
</ul>
```

### Bố trí carousel sử dụng cột

Ví dụ này sử dụng [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout), thay vì flexbox, để bố trí các mục carousel. Giá trị {{cssxref("columns")}} là `1` buộc mỗi cột rộng bằng toàn bộ container, với nội dung hiển thị một cột tại một thời điểm. Giá trị {{cssxref("text-align")}} là `center` cũng được áp dụng, buộc nội dung căn giữa với trung tâm của danh sách.

```css hidden live-sample___second-example
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  text-align: center;
  font-size: 1.7rem;
}
```

```css live-sample___second-example
ul {
  width: 100vw;
  height: 300px;
  padding: 10px;

  overflow-x: scroll;
  scroll-snap-type: x mandatory;

  columns: 1;
  text-align: center;
}
```

Chúng ta cung cấp kiểu dáng hộp cơ bản cho các mục danh sách, sau đó áp dụng style bố trí để cho phép một hoặc nhiều mục vừa vào cột nội dung đơn, tùy thuộc vào chiều rộng viewport. Số lượng thay đổi động khi danh sách rộng hơn hoặc hẹp hơn.

```css live-sample___second-example
li {
  list-style-type: none;

  display: inline-block;
  height: 100%;
  width: 200px;

  background-color: #eeeeee;
  border: 1px solid #dddddd;
  padding: 20px;
  margin: 0 10px;

  text-align: left;
}

li:nth-child(even) {
  background-color: cyan;
}
```

Các thuộc tính bố trí quan trọng như sau:

- Giá trị {{cssxref("display")}} là `inline-block` được đặt để buộc các mục danh sách đứng cạnh nhau và làm cho danh sách cuộn theo chiều ngang.
- {{cssxref("width")}} tuyệt đối là `200px` được đặt để kiểm soát kích thước của chúng, nghĩa là một hoặc nhiều mục sẽ vừa vào một cột tăng giảm theo chiều rộng viewport.
- Giá trị `text-align` là `left` được đặt để ghi đè `text-align: center` được đặt trên container cha, để nội dung mục sẽ được căn trái.

Thuộc tính {{cssxref("scroll-snap-align")}} bây giờ được đặt trên các pseudo-element {{cssxref("::column")}} — đại diện cho các cột nội dung được tạo ra bởi thuộc tính `columns` — thay vì các mục danh sách. Chúng ta muốn snap vào mỗi cột hoàn chỉnh thay vì mỗi mục danh sách riêng lẻ, hiển thị tất cả mục mới với mỗi hành động cuộn.

```css live-sample___second-example
ul::column {
  scroll-snap-align: center;
}
```

```css hidden live-sample___second-example
ul::scroll-button(*) {
  border: 0;
  font-size: 2rem;
  background: none;
  color: black;
  opacity: 0.7;
  cursor: pointer;
}

ul::scroll-button(*):hover,
ul::scroll-button(*):focus {
  opacity: 1;
}

ul::scroll-button(*):active {
  translate: 1px 1px;
}

ul::scroll-button(*):disabled {
  opacity: 0.2;
  cursor: unset;
}

ul::scroll-button(left) {
  content: "◄";
}

ul::scroll-button(right) {
  content: "►";
}

ul {
  anchor-name: --my-carousel;
}

ul::scroll-button(*) {
  position: absolute;
  position-anchor: --my-carousel;
}

ul::scroll-button(left) {
  right: calc(anchor(left) - 70px);
  bottom: calc(anchor(top) + 13px);
}

ul::scroll-button(right) {
  left: calc(anchor(right) - 70px);
  bottom: calc(anchor(top) + 13px);
}

ul {
  scroll-marker-group: after;
}

ul::scroll-marker-group {
  position: absolute;
  position-anchor: --my-carousel;
  top: calc(anchor(bottom) - 70px);
  justify-self: anchor-center;
  display: flex;
  justify-content: center;
  gap: 20px;
}
```

### Scroll marker theo cột

CSS để tạo scroll marker trong demo này gần giống với [demo trước](#creating_scroll_markers), ngoại trừ các selector khác nhau — scroll marker được tạo ra trên pseudo-element `::column` được tạo ra thay vì các mục danh sách. Lưu ý cách chúng ta đưa vào hai pseudo-element ở đây để tạo scroll marker trên các cột được tạo ra.

```css live-sample___second-example
ul::column::scroll-marker {
  content: "";
  width: 16px;
  height: 16px;
  background-color: transparent;
  border: 2px solid black;
  border-radius: 10px;
}
```

Cuối cùng, chúng ta sử dụng pseudo-class `:target-current` để đánh dấu scroll marker đang hoạt động, cung cấp cho người dùng ý tưởng về vị trí của họ trong điều hướng. Chúng ta cũng sử dụng pseudo-class {{cssxref(":target-before")}} và {{cssxref(":target-after")}} để áp dụng một số kiểu tùy chỉnh cho scroll marker trước và sau cái đang hoạt động. Chúng ta cũng đặt {{cssxref("transition")}} cho quy tắc `ul::column::scroll-marker:target-current` để các thay đổi style giữa các trạng thái khác nhau được animate mượt mà.

```css live-sample___second-example
ul::column::scroll-marker:target-before {
  border: 2px solid gray;
}

ul::column::scroll-marker:target-current {
  background-color: black;
  transition: all 0.7s;
}

ul::column::scroll-marker:target-after {
  border: 2px solid red;
  background-color: red;
}
```

## Kết quả cuối cùng của carousel responsive

Carousel responsive được hiển thị như sau:

{{EmbedLiveSample("second-example", "100%", "400px")}}

Thử điều hướng giữa các trang khác nhau bằng cách vuốt trái và phải, sử dụng thanh cuộn, nhấn scroll button, và nhấn scroll marker. Chức năng tương tự như ví dụ flexbox trang đơn, ngoại trừ bây giờ có nhiều mục danh sách trong mỗi vị trí điều hướng; scroll marker được đặt trên fragment cột, có thể chứa nhiều mục, thay vì trên mỗi mục.

Ngoài ra, thử thay đổi kích thước chiều rộng màn hình và bạn sẽ thấy số lượng mục danh sách có thể vừa vào danh sách thay đổi — và do đó số cột được tạo ra cũng thay đổi. Khi số cột thay đổi, số scroll marker cập nhật động để mỗi cột được đại diện trong scroll marker group.

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
