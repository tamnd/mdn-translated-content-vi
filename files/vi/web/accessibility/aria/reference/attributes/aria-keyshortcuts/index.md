---
title: "ARIA: thuộc tính aria-keyshortcuts"
short-title: aria-keyshortcuts
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-keyshortcuts
page-type: aria-attribute
spec-urls:
  - https://w3c.github.io/aria/#aria-keyshortcuts
  - https://www.w3.org/WAI/ARIA/apg/practices/keyboard-interface/
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-keyshortcuts` cho biết các phím tắt mà tác giả đã triển khai để kích hoạt hoặc đưa tiêu điểm tới một phần tử.

## Mô tả

Phím tắt là một chuỗi một hay nhiều phím cho phần mềm biết cần thực hiện một hành động được lập trình sẵn. Phím tắt cho phép người dùng chỉ dùng bàn phím để gọi lệnh thay vì phải mở menu hoặc dùng cảm ứng hay chuột. Thuộc tính `aria-keyshortcuts` xác định các phím đã được triển khai để kích hoạt hoặc đưa tiêu điểm tới phần tử mà thuộc tính này được đặt lên.

Thuộc tính `aria-keyshortcuts` cho các công nghệ trợ năng biết về sự tồn tại của phím tắt, để sự hiện diện của nó có thể được truyền đạt tới người dùng. Giống như mọi thuộc tính ARIA khác, nó không ảnh hưởng đến chức năng của trang; hành vi bàn phím phải được thêm bằng các trình xử lý sự kiện JavaScript.

Phím tắt áp dụng cho phần tử bị vô hiệu hóa cũng phải bị vô hiệu hóa. Ví dụ, khi tắt một phần tử cho người dùng chuột, hãy nhớ tắt nó cho cả người dùng dùng phím tắt bàn phím.

Hãy bảo đảm mọi phím tắt vừa hiển thị rõ với người dùng nhìn được, vừa sẵn có cho công nghệ trợ năng. Nếu ứng dụng của bạn đủ phức tạp để cần phím tắt, còn được gọi là "hot key", hãy cung cấp một hướng dẫn cho ứng dụng, một trang trợ năng tài liệu hóa các phím tắt và các tính năng trợ năng khác, một trang hoặc hộp thoại hướng dẫn phím tắt, hoặc phương thức khác để người dùng biết rằng các phím tắt bàn phím có tồn tại. Ngoài ra, hãy hiển thị phím tắt trong menu và chú giải công cụ.

### Quy tắc cho giá trị thuộc tính

Giá trị của thuộc tính `aria-keyshortcuts` là danh sách các tổ hợp phím, được phân tách bằng khoảng trắng, có thể được nhấn để kích hoạt một lệnh hoặc widget textbox. Mỗi tổ hợp phím bao gồm không, một hoặc nhiều phím bổ trợ theo sau là đúng một phím không bổ trợ được nhấn cùng lúc, nối với nhau bằng dấu cộng (`+`). Giá trị thuộc tính không phân biệt chữ hoa chữ thường.

Các ví dụ về phím tắt hợp lệ:

```plain
aria-keyshortcuts="A"
aria-keyshortcuts="Shift+Space"
aria-keyshortcuts="Control+Alt+."
aria-keyshortcuts="Control+Shift+&#39;"
aria-keyshortcuts="alt+shift+p control+f"
aria-keyshortcuts="Meta+C Meta+Shift+C"
```

Phím bổ trợ là các phím riêng lẻ không có tác động nào khi được dùng một mình. Chúng được viết là `Alt`, `Control`, `Shift`, `Meta` (phím Command trên Mac), hoặc `AltGraph` (phím Option trên Mac).

Phím không bổ trợ là các phím có tác động khi dùng riêng lẻ, chẳng hạn như in một ký tự, di chuyển tiêu điểm, hoặc nói chung là tạo ra một sự kiện bàn phím khi được dùng. Các phím không bổ trợ in ra một ký tự đơn bao gồm những ký tự như `P`, `z` và `.`.

Vì dấu cộng được dùng để viết tổ hợp phím, nên nó được viết là `plus` nếu được dùng như phím không bổ trợ. Các phím không bổ trợ khác được viết đầy đủ gồm khoảng trắng `Space`, `Tab`, và `Enter`, cùng mọi ký tự tạo ra hành động như `ArrowUp`, `PageUp`, và `Escape`.

Nếu bạn muốn dùng một ký tự có thể gây lỗi, như dấu ngoặc kép bên trong dấu ngoặc kép, hãy thoát ký tự đó: `Control+&#39;`.

Phím bổ trợ phải được liệt kê trước trong mỗi tổ hợp phím. Các tổ hợp phím có thể là `Control+P` hoặc `Shift+Space` và `Q`. Nếu phím tắt đầy đủ yêu cầu cả ba tổ hợp này theo đúng thứ tự, nó sẽ được viết là `aria-keyshortcuts="Control+P Shift+Space Q"`. Khi một tổ hợp phím có nhiều hơn một phím bổ trợ, thứ tự của các phím bổ trợ không quan trọng, nhưng tất cả phải đứng trước phím không bổ trợ.

Hai khai báo thuộc tính này là tương đương.

```plain example-good
aria-keyshortcuts="Shift+Control+V"
aria-keyshortcuts="control+shift+v"
```

Lưu ý rằng chữ hoa chữ thường không quan trọng. Nhưng thứ tự của phím không bổ trợ thì quan trọng.

Hai khai báo thuộc tính này là không hợp lệ vì phím không bổ trợ phải đứng cuối.

```plain example-bad
aria-keyshortcuts="V+Shift+Control"
aria-keyshortcuts="V+Control+Shift"
```

Tổ hợp phím được liệt kê phải là các phím mà người dùng cần nhấn, không phải kết quả của các lần nhấn phím kết hợp. Ví dụ, trên bàn phím USA, nếu bạn cần ký tự `@`, tổ hợp phím được viết là `"Shift+2"`, không phải `"@"` cũng không phải `"Shift+@"`.

### Thực hành tốt nhất

Khi cố gắng cải thiện khả năng truy cập của trang và ứng dụng, có một số thực hành tốt nhất cần theo để bảo đảm các "cải tiến" của bạn không làm giảm trải nghiệm người dùng. Hãy nhớ rằng không có ARIA nào tốt hơn ARIA sai.

#### Đừng ghi đè phím tắt của trình duyệt, công nghệ trợ năng hoặc hệ điều hành

Khi triển khai phím tắt, hãy đảm bảo bạn không tạo ra các phím tắt vốn đã được trình duyệt, công nghệ trợ năng hoặc hệ điều hành sử dụng, trừ khi chúng phục vụ cùng một mục đích. Ví dụ, `"Control+P"` được hầu hết user agent dùng để khởi chạy chức năng in. Thông thường, một ứng dụng web không nên tạo phím tắt `"Control+P"` vì nó sẽ chiếm mất chức năng của trình duyệt. Có ngoại lệ. Với các ứng dụng web mà việc in là rất thường xuyên, như ứng dụng email hoặc trình soạn thảo tài liệu, việc chiếm quyền `"Control+P"` của trình duyệt để dùng cho luồng in riêng của ứng dụng là điều có thể chấp nhận.

Trừ khi bạn đang tạo phiên bản HTML của một ứng dụng năng suất, có lẽ bạn nên tránh triển khai phím tắt bàn phím. Việc ghi đè phím tắt của hệ điều hành hoặc trình duyệt có thể gây phiền cho người dùng không dùng công nghệ trợ năng, nhưng nếu bạn ghi đè chức năng bàn phím của trình đọc màn hình, bạn có thể chặn hoàn toàn quyền truy cập của người dùng công nghệ trợ năng. Nếu buộc phải tạo phím tắt, hãy tránh phím tắt một ký tự và các phím tắt phổ biến của trình đọc màn hình.

#### Hãy cân nhắc sự khác biệt về ngôn ngữ và bàn phím

Hãy tính đến sự đa dạng của các loại bàn phím và tùy chọn ngôn ngữ bàn phím khác nhau. Các phím bổ trợ thường được dùng để tạo ra các ký tự dấu câu và ký tự số dành riêng cho từng ngôn ngữ. Ví dụ, các số khi tùy chọn ngôn ngữ bàn phím được đặt là French (France) sẽ dùng phím Shift.

#### Đừng dùng HTML thay thế

Thuộc tính `aria-keyshortcuts` rất giống với HTML [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey) [có vấn đề](https://webaim.org/techniques/keyboard/accesskey#spec), vốn tạo ra một phím tắt cho phần tử hiện tại. Khi một `accesskey` được định nghĩa cho một phần tử, trình duyệt sẽ tự định nghĩa các phím bổ trợ và tự xử lý toàn bộ phím tắt mà không cần scripting. Mỗi tổ hợp trình duyệt và hệ điều hành đều có các phím bổ trợ riêng cho phím không bổ trợ được đặt trong thuộc tính `accesskey`. Điều có thể hoạt động với một tổ hợp hệ điều hành, công nghệ trợ năng và trình duyệt có thể không hoạt động với tổ hợp khác. Với `aria-keyshortcuts`, các phím bổ trợ được đưa vào danh sách giá trị thuộc tính của các tổ hợp phím và chức năng phải được viết bằng script.

```html
<p>
  Nhấn
  <strong><u>S</u></strong
  >tress reliever để thư giãn!
</p>
<button accesskey="s">Stress reliever</button>
```

Trong ví dụ này, chúng ta đã bảo đảm người dùng nhìn thấy cũng biết về sự tồn tại của phím tắt bằng cách làm nổi bật ký tự không bổ trợ.

Mặc dù mục tiêu của thuộc tính `accesskey` tương ứng với ý định của `aria-keyshortcuts` và làm điều đó theo cách gốc, `accesskey` lại có rất nhiều vấn đề. Vì những vấn đề này, thông thường không nên dùng access key cho hầu hết các website và ứng dụng web đa mục đích.

Ngoài việc hỗ trợ trình duyệt kém, cùng những lo ngại với `aria-keyshortcuts` cũng áp dụng cho `accesskey`:

- Giá trị accesskey có thể xung đột với phím tắt của hệ thống, trình duyệt hoặc chức năng của công nghệ trợ năng.
- Một số giá trị phím có thể không tồn tại trên một số bàn phím, đặc biệt khi có yếu tố quốc tế hóa. Vì vậy việc điều chỉnh theo ngôn ngữ cụ thể có thể gây thêm vấn đề.
- Các giá trị dựa trên số có thể gây khó hiểu cho những người đang gặp khó khăn về nhận thức, nơi con số không có liên hệ logic với chức năng mà nó kích hoạt.
- Thông báo cho người dùng biết rằng có phím tắt, để họ nhận thức được chức năng đó. Nếu hệ thống thiếu cách thông báo cho người dùng về tính năng này, họ có thể vô tình kích hoạt một phím tắt.

## Giá trị

- `<string>`
  - : Danh sách các tổ hợp phím, được phân tách bằng khoảng trắng, mà khi được nhấn sẽ thực hiện hành động.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-keyshortcuts` trên phần tử được đặt thành `"Alt+Shift+A"`.

```html
<a href="#content" aria-keyshortcuts="Alt+Shift+A">Đi tới nội dung</a>
```

## Giao diện liên quan

- {{domxref("Element.ariaKeyShortcuts")}}
  - : Thuộc tính [`ariaKeyShortcuts`](/en-US/docs/Web/API/Element/ariaKeyShortcuts), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-keyshortcuts`.
- {{domxref("ElementInternals.ariaKeyShortcuts")}}
  - : Thuộc tính [`ariaKeyShortcuts`](/en-US/docs/Web/API/ElementInternals/ariaKeyShortcuts), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-keyshortcuts`.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** các vai trò.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Keyboard Shortcuts](https://www.w3.org/WAI/ARIA/apg/practices/keyboard-interface/#keyboardshortcuts) section in ARIA Authoring Practices
- HTML [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey) attribute
- [Issues with `accesskey`](https://webaim.org/techniques/keyboard/accesskey#spec)
