---
title: "ARIA: thuộc tính aria-atomic"
short-title: aria-atomic
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-atomic
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-atomic
sidebar: accessibilitysidebar
---

Trong các vùng trực tiếp ARIA, thuộc tính toàn cục `aria-atomic` cho biết công nghệ hỗ trợ như trình đọc màn hình sẽ trình bày toàn bộ hay chỉ một phần của vùng đã thay đổi, dựa trên các thông báo thay đổi được định nghĩa bởi thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant).

## Mô tả

Vùng trực tiếp là các phần của trang web được cập nhật, dù có tương tác người dùng hay không, trong khi tiêu điểm của người dùng đang ở nơi khác. Vì chúng cập nhật ngoài tiêu điểm của người dùng, công nghệ hỗ trợ như trình đọc màn hình có thể không "thấy" bản cập nhật để thông báo cho người dùng. WAI-ARIA có 4 thuộc tính cho phép nhà phát triển nhận diện các vùng trực tiếp này và cho công nghệ hỗ trợ biết cách xử lý chúng, bao gồm [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live), [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant), [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) và `aria-atomic`.

Khi nội dung của một vùng trực tiếp thay đổi, DOM sẽ được duyệt từ phần tử bị thay đổi qua các phần tử tổ tiên của nó để tìm phần tử đầu tiên có `aria-atomic` được đặt. Điều này xác định nội dung mà người dùng sẽ được trình bày.

Nếu không có phần tử tổ tiên nào đặt rõ ràng `aria-atomic`, chỉ nút hoặc các nút nội dung vùng trực tiếp đã được cập nhật mới được đọc. Sự khác nhau giữa việc bỏ qua hoàn toàn `aria-atomic` và việc đặt rõ ràng nút tổ tiên của vùng trực tiếp ARIA với `aria-atomic="false"` là việc đặt rõ ràng `aria-atomic="false"` sẽ ngăn trình đọc màn hình đi lên chuỗi tổ tiên. Cả hai cách đều dẫn đến việc chỉ nút đã cập nhật được đọc. Khi đặt `aria-atomic="true"`, toàn bộ vùng đã thay đổi sẽ được trình bày như một khối, bao gồm cả `label` của nút đã cập nhật nếu có.

## Giá trị

- `false` (mặc định)
  - : chỉ trình bày nút hoặc các nút đã thay đổi.
- `true`
  - : trình bày toàn bộ vùng đã thay đổi như một khối, bao gồm nhãn do tác giả định nghĩa nếu có.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles).

## Đặc tả

{{Specifications}}

## Xem thêm

- [Event.ariaAtomic](/en-US/docs/Web/API/Element/ariaAtomic)
