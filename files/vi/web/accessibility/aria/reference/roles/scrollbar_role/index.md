---
title: "ARIA: vai trò scrollbar"
short-title: scrollbar
slug: Web/Accessibility/ARIA/Reference/Roles/scrollbar_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#scrollbar
sidebar: accessibilitysidebar
---

`scrollbar` là một đối tượng đồ họa điều khiển việc cuộn nội dung trong một vùng hiển thị.

## Mô tả

`scrollbar` là một range điều khiển phần nào của nội dung trong viewport đang hiển thị trong khung của viewport; dù viewport là toàn bộ kích thước trình duyệt, một iframe, hay [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) của bất kỳ phần tử nào.

### Thanh cuộn là gì

Nhiều ứng dụng cung cấp thanh cuộn gốc khi vùng nội dung lớn hơn cửa sổ ứng dụng. Thanh cuộn thường xuất hiện ở bên phải hoặc phía dưới của vùng hiển thị. Thanh cuộn gốc xuất hiện như những vùng track hình chữ nhật mảnh theo chiều dài của viewport mà nó điều khiển, với một thành phần giao diện gọi là thumb hoặc scroller có thể kéo dọc theo track để di chuyển nội dung liên quan trong viewport. Một số thanh cuộn có mũi tên ở mỗi đầu track cho phép cuộn viewport một quãng ngắn khi được kích hoạt.

Hãy lấy tài liệu này làm ví dụ: nếu viewport là toàn bộ cửa sổ trình duyệt và nội dung cao hơn viewport, trong hầu hết trình duyệt thanh cuộn ở mép phải cửa sổ biểu diễn toàn bộ chiều dài trang và thumb của thanh cuộn biểu diễn phần nội dung trang hiện đang nằm trong viewport.

Thanh cuộn cũng có thể xuất hiện trên các viewport là các phần con của toàn bộ cửa sổ trình duyệt. Tiếp tục với nội dung này làm ví dụ, nếu nội dung được nhúng trong một {{HTMLElement('iframe')}} hoặc {{HTMLElement('object')}}, thanh cuộn dọc gốc sẽ có chiều cao của khung. Thanh cuộn thường có chiều dài bằng viewport, nhưng không bắt buộc phải như vậy.

Nếu bạn không thấy thanh cuộn ngay lúc này, có thể là do trình duyệt của bạn chỉ hiển thị thanh cuộn khi đang cuộn hoặc chỉ khi nội dung của phần tử quá lớn so với block formatting context của nó. Tùy thuộc vào trình duyệt và hệ điều hành, thanh cuộn có thể được làm hiển thị ngay cả khi nội dung vừa khít trong viewport khi không cần hoặc không thể cuộn.

### ARIA `scrollbar`

Tốt nhất luôn dùng thanh cuộn gốc. Bạn có thể dùng thuộc tính CSS {{CSSXref('overflow')}} để đảm bảo thanh cuộn gốc xuất hiện. Một [đặc tả CSS scrollbar](https://drafts.csswg.org/css-scrollbars/) đang được phát triển. Một số trình duyệt cho phép [tạo kiểu thanh cuộn qua pseudo-element có tiền tố](/en-US/docs/Web/CSS/Reference/Selectors/::-webkit-scrollbar).

Vì việc tạo kiểu thanh cuộn gốc trong lịch sử bị hạn chế, bạn có thể bắt gặp một scrollbar được triển khai bằng JavaScript mà bạn cần hỗ trợ và làm cho nó hoàn toàn có thể truy cập. Khi đó, bạn có thể dùng vai trò `scrollbar` để thông báo cho công nghệ hỗ trợ rằng một điều khiển giao diện là một thanh cuộn tương tác.

Phần tử mang vai trò `scrollbar` là một đối tượng đồ họa điều khiển việc cuộn nội dung trong một vùng hiển thị; đây là vai trò ARIA cho biết một phần tử là thanh cuộn. Phần tử HTML tương tự nhất là loại `range` của {{HTMLElement('input')}}, [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range).

Phần tử `scrollbar` có hai thuộc tính bắt buộc: [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) và [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow). Thuộc tính `aria-controls` tham chiếu đến [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của vùng có thể cuộn mà nó điều khiển. Thuộc tính `aria-valuenow` xác định giá trị hiện tại của scrollbar.

Mặc dù `aria-valuenow` luôn bắt buộc, các thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) và [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) chỉ cần được đặt cho vai trò scrollbar khi giá trị nhỏ nhất của `scrollbar` không phải là 0 hoặc giá trị lớn nhất không phải là 100. Giá trị của `aria-valuenow` phải luôn nằm giữa giá trị tối thiểu và tối đa, bao gồm cả hai đầu, hoặc giữa `0` và `100` bao gồm cả hai đầu nếu giá trị tối thiểu và tối đa mặc định lần lượt là `0` và `100`. `aria-valuenow` cho biết viewport đang gần đáy tài liệu đến mức nào. Hãy nghĩ nó như một progress bar, trong đó điểm đầu của tài liệu là giá trị nhỏ nhất và cuối tài liệu là giá trị lớn nhất.

`scrollbar` biểu diễn giá trị hiện tại và khoảng giá trị có thể thông qua kích thước của thanh cuộn và vị trí của thumb so với phạm vi hiển thị theo hướng nó điều khiển (ngang hoặc dọc). Nói cách khác, chiều dài của `scrollbar` (chiều cao hoặc chiều rộng) biểu diễn toàn bộ nội dung trong viewport. Giá trị `aria-valuemin` biểu diễn phần đầu của nội dung và thanh cuộn, giá trị `aria-valuemax` biểu diễn phần cuối của nội dung và cuối thanh cuộn. `aria-valuenow` biểu diễn nội dung hiện đang hiển thị trong viewport và vị trí hiện tại, hoặc giá trị, của thumb có thể di chuyển. Giá trị `aria-valuenow` thường sẽ được công nghệ hỗ trợ hiển thị như một phần trăm giữa `aria-valuemin` và `aria-valuemax` được tính toán bởi công nghệ hỗ trợ.

> [!NOTE]
> Công nghệ hỗ trợ thường hiển thị giá trị của `aria-valuenow` như phần trăm của một khoảng giữa `aria-valuemin` và `aria-valuemax`, trừ khi [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext) được đặt. Nên đặt các giá trị `aria-valuemin`, `aria-valuemax`, và `aria-valuenow` theo cách phù hợp cho phép tính này.

Giống như thanh cuộn gốc, người dùng tương tác với các phần tử `scrollbar` trực tiếp hoặc gián tiếp bằng chuột, bàn di chuột, bàn phím và đầu vào giọng nói. Việc triển khai vai trò `scrollbar` cũng phải hỗ trợ tất cả các phương thức tương tác này.

Khi dùng chuột, người dùng phải có thể kích hoạt `scrollbar` bằng cách nhấp vào các mũi tên cuộn ở mỗi đầu thanh cuộn, nếu có, nhấp vào một phần trống của track cuộn, cũng như nhấp và kéo thumb cuộn.

Việc cuộn bằng bàn phím cũng phải được hỗ trợ. Khi focus nằm trong viewport do `scrollbar` điều khiển, các phím <kbd>Up Arrow</kbd> và <kbd>Down Arrow</kbd> (hoặc <kbd>Left Arrow</kbd> và <kbd>Right Arrow</kbd> đối với thanh cuộn ngang) nên di chuyển thumb thanh cuộn theo tỷ lệ. Ngoài ra, các phím <kbd>Page Up</kbd>, <kbd>Page Down</kbd>, <kbd>Space</kbd>, và <kbd>Shift + Space</kbd> phải di chuyển nội dung và thumb cuộn lên hoặc xuống một khoảng bằng chiều cao (hoặc chiều rộng) của viewport cho mỗi lần nhấn phím cho đến khi phần đáy hoặc phần đỉnh (hoặc trái hoặc phải) của nội dung được nhìn thấy.

JavaScript phải được dùng để chuyển hành động `scrollbar` thành các lệnh cuộn, cung cấp phản hồi cho người dùng bằng cách:

1. Cập nhật trực quan phần tử `scrollbar`,
2. Cuộn nội dung của viewport, và
3. Cập nhật giá trị thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow).

Hướng mặc định của vai trò `scrollbar` là dọc. Việc bao gồm [`aria-orientation="vertical"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation), trong trường hợp này, là tùy chọn. Hướng biểu thị hướng của thanh cuộn và hiệu ứng cuộn lên vùng hiển thị do thanh cuộn điều khiển. Nếu việc cuộn là trái sang phải hoặc phải sang trái chứ không phải từ trên xuống dưới, hãy thêm `aria-orientation="horizontal"` vào phần tử mang vai trò `scrollbar`.

> [!NOTE]
> Tên truy cập được là **bắt buộc**. Nếu vai trò `scrollbar` được áp dụng cho phần tử HTML {{HTMLElement('input')}} (hoặc phần tử `<meter>` hay `<progress>`), tên truy cập được có thể lấy từ {{HTMLElement('label')}} liên kết. Nếu không, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) nếu không có nhãn hiển thị.

### Mọi hậu duệ đều mang tính trình bày

Có một số kiểu thành phần giao diện người dùng khi được biểu diễn trong API truy cập của nền tảng thì chỉ có thể chứa văn bản. API truy cập không có cách biểu diễn các phần tử ngữ nghĩa nằm bên trong `scrollbar`. Để xử lý hạn chế này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử hậu duệ của bất kỳ phần tử `scrollbar` nào, vì đây là một vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, xét phần tử `scrollbar` sau, chứa một tiêu đề.

```html
<div role="scrollbar"><h3>Title of my scrollbar</h3></div>
```

Vì các hậu duệ của `scrollbar` mang tính trình bày, đoạn mã sau là tương đương:

```html
<div role="scrollbar"><h3 role="presentation">Title of my scrollbar</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với nội dung sau trong [cây truy cập](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="scrollbar">Title of my scrollbar</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) (Bắt buộc)
  - : Xác định viewport, thông qua `id`, mà nội dung của nó được thanh cuộn điều khiển.
- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) (Bắt buộc)
  - : Đặt thành một giá trị thập phân giữa `0`, hoặc `aria-valuemin` nếu có, và `aria-valuemax`, cho biết giá trị hiện tại của scrollbar.
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Công nghệ hỗ trợ thường biểu diễn giá trị `aria-valuenow` như một phần trăm. Nếu cách này không hữu ích, hãy dùng thuộc tính này để làm giá trị scrollbar dễ hiểu hơn cho người dùng.
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
  - : Đặt thành giá trị thập phân biểu diễn giá trị nhỏ nhất và nhỏ hơn `aria-valuemax`. Nếu không có, giá trị mặc định là `0`.
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
  - : Đặt thành giá trị thập phân biểu diễn giá trị lớn nhất và lớn hơn `aria-valuemin`. Nếu không có, giá trị mặc định là `100`.
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Khi không dùng điều khiển form gốc và do đó không thể liên kết scrollbar với {{HTMLElement('label')}}, nếu có văn bản hiển thị có thể cung cấp tên truy cập được bắt buộc, hãy đặt thành [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của một phần tử chứa văn bản đóng vai trò nhãn. Nếu không, hãy dùng `aria-label`.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Nếu không thể dùng {{htmlelement('label')}}, và cũng không có văn bản hiển thị nào có thể được tham chiếu bởi `aria-labelledby`, thì cung cấp chuỗi dùng để gắn nhãn cho phần tử `scrollbar`, cung cấp tên truy cập được bắt buộc.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : Theo mặc định, hướng là `vertical`. Thuộc tính có thể được bao gồm và đặt thành `horizontal`, `undefined` (mặc định cho tất cả vai trò nếu không nêu khác), hoặc `vertical`.

### Tương tác bàn phím

- <kbd>Up Arrow</kbd>
  - : Nội dung trong viewport đi lên một dòng, đồng thời thumb di chuyển lên slider của thanh cuộn theo tỷ lệ, cho đến khi chạm đầu trên của nội dung và thanh cuộn.
- <kbd>Down Arrow</kbd>
  - : Nội dung trong viewport đi xuống một dòng, đồng thời thumb di chuyển xuống slider của thanh cuộn theo tỷ lệ, cho đến khi chạm đáy của nội dung và thanh cuộn.
- <kbd>Left Arrow</kbd>
  - : Với cuộn ngang, nội dung trong viewport đi sang trái một ký tự, đồng thời thumb di chuyển sang trái trên slider của thanh cuộn theo tỷ lệ, cho đến khi mép trái của nội dung chạm đầu trái của viewport và thumb thẳng hàng với đầu trái của thanh cuộn.
- <kbd>Right Arrow</kbd>
  - : Với cuộn ngang, nội dung trong viewport đi sang phải một ký tự, đồng thời thumb di chuyển sang phải trên slider của thanh cuộn theo tỷ lệ, cho đến khi mép phải của nội dung chạm đầu phải của viewport và thumb thẳng hàng với đầu phải của thanh cuộn.
- <kbd>Page Up</kbd> và <kbd>Shift + Space</kbd>
  - : Nội dung trong viewport đi lên một khoảng bằng chiều cao của một viewport, đồng thời thumb di chuyển lên slider của thanh cuộn theo tỷ lệ, cho đến khi chạm đầu trên của nội dung và thanh cuộn.
- <kbd>Page Down</kbd> và <kbd>Space</kbd>
  - : Nội dung trong viewport đi xuống một khoảng bằng chiều cao của một viewport, đồng thời thumb di chuyển xuống slider của thanh cuộn theo tỷ lệ, cho đến khi chạm đáy của nội dung và thanh cuộn.

## Ví dụ

Sau đây là ví dụ về một từ có thể quá dài so với vùng chứa cha.

```html
<div id="pi-label">Pi</div>
<div id="pi">
  3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
</div>
<div
  role="scrollbar"
  aria-labelledby="pi-label"
  aria-controls="pi"
  aria-orientation="horizontal"
  aria-valuenow="0"
  aria-valuemin="0"
  aria-valuemax="100">
  <div id="thumb"></div>
</div>
```

Khi dùng các vai trò ARIA thay cho các tính năng giao diện gốc, CSS phải được dùng để tạo kiểu cho thanh cuộn và thumb, và JavaScript phải được dùng để xử lý tất cả sự kiện bàn phím và con trỏ.

CSS có thể đã được dùng để đảm bảo giá trị PI tràn ra có một thanh cuộn gốc:

```html
<h3 id="PI">Pi</h3>
<p class="pi" tabindex="0" aria-labelledby="PI">
  3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
</p>
```

```css
.pi {
  overflow: auto;
  max-width: 100%;
}
```

CSS trên có nghĩa là một thanh cuộn gốc sẽ xuất hiện khi người dùng tương tác với vùng hiển thị của đoạn văn bản nếu độ dài của từ dài nhất trong đoạn rộng hơn khung chứa đoạn văn bản. Thuộc tính `tabindex` được thêm để cho phép người dùng dùng bàn phím điều hướng đến và cuộn nội dung bị tràn.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range),
- Phần tử HTML {{HTMLElement('progress')}}
- Phần tử HTML {{HTMLElement('meter')}}
- Các widget range khác gồm:
  - [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
  - [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
  - [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (nếu có thể focus)
  - [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
  - [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [Sự kiện `scroll` của Document](/en-US/docs/Web/API/Document/scroll_event)
