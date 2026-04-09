---
title: "ARIA: thuộc tính aria-dropeffect"
short-title: aria-dropeffect
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-dropeffect
page-type: aria-attribute
status:
  - deprecated
spec-urls: https://w3c.github.io/aria/#aria-dropeffect
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-dropeffect` cho biết những chức năng nào có thể được thực hiện khi một đối tượng đang được kéo được thả lên đích thả. {{deprecated_inline}}

## Mô tả

Đã lỗi thời trong ARIA 1.1, thuộc tính `aria-dropeffect` cho biết những chức năng nào có thể được thực hiện khi một đối tượng đang được kéo được thả lên đích thả. Thuộc tính toàn cục `aria-dropeffect` cung cấp cho người dùng công nghệ hỗ trợ cùng thông tin mà [`DataTransfer.dropEffect`](/en-US/docs/Web/API/DataTransfer/dropEffect) cung cấp cho người dùng nhìn thấy thông qua biểu tượng dropeffect.

Phần văn bản được chọn, hình ảnh và liên kết có thể được kéo theo mặc định. Việc đặt thuộc tính toàn cục [`draggable="true"`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable), là một phần của [Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) của HTML5, cùng với một bộ xử lý sự kiện [`dragstart`](/en-US/docs/Web/API/HTMLElement/dragstart_event), có nghĩa là bất kỳ nút DOM nào cũng có thể được làm cho kéo được.

Khi một sự kiện kéo xảy ra, một hình ảnh bán trong suốt của phần tử đang được kéo sẽ được tạo và đi theo con trỏ của người dùng trong suốt quá trình kéo. Hình ảnh mặc định có thể được thay đổi thành bất kỳ hình ảnh nào bằng [`setDragImage`](/en-US/docs/Web/API/DataTransfer/setDragImage). Bên cạnh hình ảnh mặc định xác định phần tử đang được kéo, còn có thuộc tính [`dataTransfer.dropEffect`](/en-US/docs/Web/API/DataTransfer/dropEffect) có thể được dùng để điều khiển phản hồi trực quan mà người dùng nhận được trong thao tác kéo và thả. Thuộc tính `aria-dropeffect` nên được dùng để cung cấp cho người dùng công nghệ hỗ trợ cùng phản hồi như phản hồi được cung cấp cho người dùng nhìn thấy qua thuộc tính `dataTransfer.dropEffect`.

`dropeffect` định nghĩa con trỏ mà trình duyệt hiển thị trong khi kéo, và được đặt trên phần tử mà phần tử khác có thể được thả vào. Trong lúc kéo, khi phần tử kéo được di chuyển qua các vùng thả khác nhau, các hiệu ứng kéo, cả `dataTransfer.dropeffect` lẫn `aria-dropeffect`, nên được sửa đổi để chỉ ra loại thao tác sẽ xảy ra nếu phần tử đang được kéo được thả xuống.

Một phần tử có thể hỗ trợ nhiều hơn một hiệu ứng thả. Vì vậy, giá trị của thuộc tính `aria-dropeffect` là một danh sách các chức năng được phân tách bằng khoảng trắng. Các chức năng bao gồm `copy`, `execute`, `link`, và `move`. Giá trị mặc định là `none`, nghĩa là ứng dụng không hỗ trợ chức năng nào. Đặt `aria-dropeffect="popup"` sẽ thông báo cho người dùng công nghệ hỗ trợ rằng có một menu hoặc hộp thoại bật lên chứa các thao tác kéo để người dùng chọn.

Việc bao gồm thuộc tính này cho phép công nghệ hỗ trợ truyền đạt các tùy chọn kéo có thể có cho người dùng công nghệ hỗ trợ, nhưng không thêm bất kỳ chức năng thực sự nào.

Thuộc tính `aria-dropeffect` dự kiến sẽ được thay thế bằng một tính năng mới trong một phiên bản tương lai của WAI-ARIA và được xem là đã lỗi thời.

Thông thường, các chức năng hiệu ứng thả chỉ có thể được cung cấp sau khi một đối tượng đã được nắm để kéo, vì các chức năng hiệu ứng thả sẵn có phụ thuộc vào đối tượng đang được kéo. Vì vậy, bạn thường sẽ thêm `aria-dropeffect` vào tất cả các đích thả tiềm năng khi sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}} được kích hoạt.

## Giá trị

Giá trị là danh sách các hành động khả dĩ được phân tách bằng khoảng trắng. Các token hợp lệ là:

- `copy`
  - : Một bản sao của đối tượng nguồn sẽ được thả vào đích.
- `execute`
  - : Một chức năng được hỗ trợ bởi đích thả sẽ được thực thi, sử dụng nguồn kéo làm đầu vào.
- `link`
  - : Một tham chiếu hoặc lối tắt tới đối tượng đang kéo sẽ được tạo trong đối tượng đích.
- `move`
  - : Đối tượng nguồn sẽ bị xóa khỏi vị trí hiện tại và được thả vào đích.
- `none` (mặc định)
  - : Không có thao tác nào có thể được thực hiện; về mặt thực tế sẽ hủy thao tác kéo nếu có cố gắng thả vào đối tượng này. Bị bỏ qua nếu kết hợp với bất kỳ token nào khác; ví dụ, `none copy` tương đương với giá trị `copy`.
- `popup`
  - : Có một menu hoặc hộp thoại bật lên cho phép người dùng chọn một trong các thao tác kéo (copy, move, link, execute) và các chức năng kéo khác như hủy.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-grabbed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-grabbed)
- Thuộc tính toàn cục HTML `draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable)
- [Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) của HTML
- {{domxref('dataTransfer')}}
- {{domxref('DataTransfer.dropEffect')}}
- {{domxref("HTMLElement/dragstart_event", "dragstart")}}
