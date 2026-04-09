---
title: "ARIA: thuộc tính aria-owns"
short-title: aria-owns
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-owns
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-owns
sidebar: accessibilitysidebar
---

Thuộc tính `aria-owns` xác định một phần tử (hoặc nhiều phần tử) để định nghĩa mối quan hệ trực quan, chức năng hoặc ngữ cảnh giữa phần tử cha và các phần tử con của nó khi cấu trúc DOM không thể dùng để biểu diễn mối quan hệ đó.

## Mô tả

Mỗi phần tử đều là phần tử cha, anh em hoặc con của một phần tử khác. Đối tượng tài liệu, được tạo bởi các phần tử HTML và các nút văn bản, là nền tảng của cây DOM. Accessibility Object Model (<abbr>AOM</abbr>) dựa vào một DOM được xây dựng tốt để cho phép công nghệ hỗ trợ truyền đạt thông tin có ý nghĩa về nội dung tài liệu đến người dùng.

Có những trường hợp bố cục hiển thị trên màn hình có thể khác với cấu trúc DOM bên dưới do khả năng JavaScript thay đổi nội dung và CSS thay đổi bố cục. Khi đó, thuộc tính `aria-owns` có thể được dùng để tái tạo một mối quan hệ có ý nghĩa cho công nghệ hỗ trợ sử dụng DOM.

Khi các phần tử trông có vẻ liên quan với nhau về mặt hình ảnh nhưng không liên kết trong DOM, thuộc tính `aria-owns` cho phép tạo ra mối quan hệ xuất hiện trên màn hình trong lớp trợ năng để công nghệ hỗ trợ sử dụng. Lý do **duy nhất** để thêm `aria-owns` là để phơi bày mối quan hệ ngữ cảnh cha/con cho công nghệ hỗ trợ khi cấu trúc DOM không thể cung cấp mối quan hệ đó.

"Phần tử sở hữu" là bất kỳ phần tử tổ tiên nào trong DOM của một phần tử. Nếu một phần tử, về mặt trực quan, chức năng hoặc ngữ cảnh, có vẻ "sở hữu" một phần tử khác, tức là như thể nó là tổ tiên của phần tử đó, nhưng thực tế không phải là tổ tiên trong DOM, hãy thêm `aria-owns` để tạo mối quan hệ đó. Thêm thuộc tính vào phần tử sở hữu, tham chiếu đến phần tử (hoặc các phần tử) không phải con trực tiếp được sở hữu, để cho công nghệ hỗ trợ biết rằng phần tử đó nên được xem như con.

Tham chiếu đến ID của một hoặc nhiều phần tử cho phép bất kỳ phần tử nào "sở hữu" bất kỳ phần tử nào khác bằng một khai báo `aria-owns`. Giá trị của thuộc tính `aria-owns` là danh sách các tham chiếu ID, được phân tách bằng dấu cách, tham chiếu đến ID của một hoặc nhiều phần tử trong tài liệu.

> [!NOTE]
> Một phần tử "được sở hữu" là bất kỳ phần tử hậu duệ nào trong DOM của phần tử đó, bất kỳ phần tử nào được chỉ định là con thông qua `aria-owns`, hoặc bất kỳ hậu duệ DOM nào của phần tử con được sở hữu. Phần tử được `aria-owns` sở hữu nên là phần tử thuộc một cây cha riêng trong DOM nhưng lại được coi là con của phần tử hiện tại.

Không dùng `aria-owns` để thay thế cho cấu trúc phân cấp DOM. Nếu mối quan hệ đã được biểu diễn trong DOM thì không dùng `aria-owns`.

Phần tử con mặc định đã thuộc về phần tử cha trong DOM: trong trường hợp đó, không nên dùng `aria-owns`. Tránh dùng thuộc tính `aria-owns` để sắp xếp lại các phần tử con hiện có theo một thứ tự khác.

Khi dùng `aria-owns`, hãy bảo đảm bạn [quản lý thứ tự focus](https://css-tricks.com/focus-management-and-inert/). Bảo đảm thứ tự focus trực quan khớp với thứ tự đọc của công nghệ hỗ trợ.

Một ví dụ nên dùng `aria-owns` là các menu con bật lên trông như được đặt gần một menu cha, nhưng không thể lồng trong DOM bên trong menu cha vì điều đó sẽ ảnh hưởng đến trình bày trực quan. Trong trường hợp đó, dùng `aria-owns` để trình bày menu con như một phần tử con của menu cha đối với bộ đọc màn hình.

> [!NOTE]
> Thuộc tính `aria-owns` chỉ nên được dùng khi mối quan hệ cha/con không thể xác định từ DOM.

Nếu một phần tử vừa có `aria-owns` vừa có các phần tử con trong DOM, thứ tự của các phần tử con là:

1. Các phần tử con thực sự trong DOM trước,
2. Sau đó đến các phần tử được tham chiếu trong `aria-owns`.

Thứ tự này có thể được thay đổi bằng cách đưa các tham chiếu ID của chính các phần tử con trong DOM vào giá trị `aria-owns`.

Thuộc tính {{CSSXRef('order')}}, thuộc bố cục flex hoặc grid, có thể được dùng để thay đổi thứ tự các phần tử flex và grid, làm chúng xuất hiện theo thứ tự khác với thứ tự trong tài liệu nguồn, từ đó tạo ra sự khác biệt giữa thứ tự logic của các phần tử. Dù có thể bạn sẽ muốn sắp xếp lớp trợ năng để khớp với các thay đổi thứ tự do thuộc tính CSS {{CSSXref('order')}} tạo ra, nhưng tránh cả thuộc tính `order` lẫn `aria-owns` vẫn là lựa chọn tốt nhất.

Hãy bảo đảm các phần tử được sở hữu chỉ có một chủ sở hữu. Không chỉ định `id` của một phần tử trong `aria-owns` của nhiều phần tử khác nhau. Một phần tử chỉ có thể có một chủ sở hữu.

> [!WARNING]
> Mặc dù [`aria-owns` hiện đã được hỗ trợ](https://a11ysupport.io/tech/aria/aria-owns_attribute) trong mọi trình duyệt hiện đại, `aria-owns` có thể không được hiển thị cho người dùng VoiceOver trên macOS và iOS trước iOS 17.3 và macOS 14.3.

## Giá trị

- `id` list
  - : Danh sách các giá trị ID được phân tách bằng dấu cách, tham chiếu đến các phần tử được phần tử hiện tại sở hữu

## Giao diện liên quan

- {{domxref("Element.ariaOwnsElements")}}
  - : Thuộc tính `ariaOwnsElements` là một phần của giao diện mỗi phần tử.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-owns` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaOwnsElements")}}
  - : Thuộc tính `ariaOwnsElements` là một phần của giao diện mỗi custom element.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-owns` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong **TẤT CẢ** các vai trò.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- [`aria-owns` browser support](https://a11ysupport.io/tech/aria/aria-owns_attribute)
