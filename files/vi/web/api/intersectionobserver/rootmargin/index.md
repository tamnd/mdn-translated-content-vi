---
title: "IntersectionObserver: rootMargin property"
short-title: rootMargin
slug: Web/API/IntersectionObserver/rootMargin
page-type: web-api-instance-property
browser-compat: api.IntersectionObserver.rootMargin
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`rootMargin`** của giao diện {{domxref("IntersectionObserver")}} là một chuỗi có cú pháp tương tự với thuộc tính CSS {{cssxref("margin")}}.

Mỗi cạnh của hình chữ nhật được biểu diễn bởi `rootMargin` được thêm vào cạnh tương ứng trong {{Glossary("bounding box")}} của phần tử {{domxref("IntersectionObserver.root", "root")}} trước khi thực hiện kiểm tra giao nhau.
Điều này cho phép bạn, ví dụ, điều chỉnh các ranh giới ra ngoài để phần tử đích được coi là 100% hiển thị ngay cả khi một số pixel chiều rộng hoặc chiều cao bị cắt xén, hoặc coi đích là hiển thị một phần nếu một cạnh quá gần với cạnh của hộp giới hạn gốc.

Xem [how intersections are calculated](/en-US/docs/Web/API/Intersection_Observer_API#how_intersection_is_calculated) để hiểu sâu hơn về lề gốc và cách nó hoạt động với hộp giới hạn của gốc.

## Giá trị

Một chuỗi, được định dạng tương tự như giá trị thuộc tính CSS {{cssxref("margin")}}, chứa các độ lệch cho một hoặc nhiều cạnh của hộp giới hạn gốc.
Các độ lệch này được thêm vào các giá trị tương ứng trong hộp giới hạn của gốc trước khi tính toán giao điểm giữa hình chữ nhật kết quả và ranh giới của phần tử đích.

Chuỗi được trả về bởi thuộc tính này có thể không khớp với chuỗi được chỉ định khi {{domxref("IntersectionObserver")}} được khởi tạo.
Ví dụ, kết quả luôn chứa bốn thành phần, mặc dù đầu vào có thể có ít hơn.

Nếu `rootMargin` không được chỉ định khi đối tượng được khởi tạo, nó mặc định là chuỗi `"0px 0px 0px 0px"`, có nghĩa là giao nhau sẽ được tính toán giữa hình chữ nhật ranh giới không được sửa đổi của phần tử gốc và ranh giới của đích.
[How intersections are calculated](/en-US/docs/Web/API/Intersection_Observer_API#how_intersection_is_calculated) mô tả cách `rootMargin` được sử dụng chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
