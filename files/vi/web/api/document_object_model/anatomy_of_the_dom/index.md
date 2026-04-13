---
title: Cấu trúc của DOM
slug: Web/API/Document_Object_Model/Anatomy_of_the_DOM
page-type: guide
---

{{DefaultAPISidebar("DOM")}}

DOM biểu diễn tài liệu XML hoặc HTML dưới dạng cây. Trang này giới thiệu cấu trúc cơ bản của cây DOM và các thuộc tính và phương thức khác nhau được sử dụng để điều hướng nó.

Để bắt đầu, chúng ta cần giới thiệu một số khái niệm liên quan đến cây. Cây là cấu trúc dữ liệu được tạo thành từ các _nút_. Mỗi nút chứa một số _dữ liệu_. Các nút được tổ chức theo cách phân cấp: mỗi nút có một _nút cha_ duy nhất (ngoại trừ nút gốc, không có cha) và một danh sách được sắp xếp gồm không hoặc nhiều _nút con_. Bây giờ chúng ta có thể định nghĩa:

- Nút không có cha được gọi là _gốc_ của cây.
- Nút không có con được gọi là _lá_.
- Các nút chia sẻ cùng cha được gọi là _anh em_.
- Nếu chúng ta có thể đi từ nút A đến nút B bằng cách liên tục theo các liên kết cha, thì A là _hậu duệ_ của B và B là _tổ tiên_ của A.
- Các nút trong cây được liệt kê theo _thứ tự cây_ bằng cách đầu tiên liệt kê bản thân nút, sau đó liệt kê đệ quy từng nút con theo thứ tự (duyệt trước, theo chiều sâu).

## Giao diện Node và các lớp con của nó

Tất cả các nút trong DOM được đại diện bởi các đối tượng thực hiện giao diện {{domxref("Node")}}. Giao diện `Node` bao gồm nhiều khái niệm đã định nghĩa trước đó:

- Thuộc tính {{domxref("Node/parentNode", "parentNode")}} trả về nút cha, hoặc `null` nếu nút không có cha.
- Thuộc tính {{domxref("Node/childNodes", "childNodes")}} trả về {{domxref("NodeList")}} của các nút con.
- Phương thức {{domxref("Node/getRootNode", "getRootNode()")}} trả về gốc của cây chứa nút.
- Phương thức {{domxref("Node/hasChildNodes", "hasChildNodes()")}} trả về `true` nếu nó có bất kỳ nút con nào.
- Thuộc tính {{domxref("Node/previousSibling", "previousSibling")}} và {{domxref("Node/nextSibling", "nextSibling")}} trả về các nút anh em trước và sau.
- Phương thức {{domxref("Node/contains", "contains()")}} trả về `true` nếu một nút nhất định là hậu duệ của nút.

Bạn hiếm khi làm việc với các đối tượng `Node` thuần túy mà thay vào đó, tất cả các đối tượng trong DOM thực hiện một trong các giao diện kế thừa từ `Node`.

## Các loại nút

### Nút `Document`

Trong tài liệu HTML, gốc của cây là một đối tượng {{domxref("Document")}}. Tất cả các nút khác trong DOM là hậu duệ của nút Document.

### Nút `Element`

Nút {{domxref("Element")}} đại diện cho phần tử trong tài liệu, chẳng hạn như thẻ HTML. Các phần tử là loại nút phổ biến nhất bạn sẽ làm việc trong DOM.

### Nút `Text`

Nút {{domxref("Text")}} đại diện cho nội dung văn bản trong tài liệu. Nút văn bản luôn là lá, nghĩa là chúng không có con.

### Nút `Attr`

Nút {{domxref("Attr")}} đại diện cho thuộc tính của phần tử. Các nút `Attr` không phải là con của phần tử mà thuộc về phần tử.

### Nút `Comment`

Nút {{domxref("Comment")}} đại diện cho chú thích trong HTML.

## Điều hướng cây DOM

Khi làm việc với DOM, bạn thường cần di chuyển từ nút này sang nút khác. DOM cung cấp một số thuộc tính và phương thức để điều hướng cây:

### Điều hướng cha

Bạn có thể điều hướng lên cây bằng cách sử dụng thuộc tính {{domxref("Node/parentNode", "Node.parentNode")}} và {{domxref("Node/parentElement", "Node.parentElement")}}.

### Điều hướng con

Bạn có thể điều hướng xuống cây bằng cách sử dụng {{domxref("Node/firstChild", "Node.firstChild")}}, {{domxref("Node/lastChild", "Node.lastChild")}}, {{domxref("Node/childNodes", "Node.childNodes")}}, {{domxref("Element.firstElementChild")}}, và {{domxref("Element.lastElementChild")}}.

### Điều hướng anh em

Bạn có thể điều hướng ngang cây bằng cách sử dụng {{domxref("Node/previousSibling", "Node.previousSibling")}}, {{domxref("Node/nextSibling", "Node.nextSibling")}}, {{domxref("Element.previousElementSibling")}} và {{domxref("Element.nextElementSibling")}}.

## Xem thêm

- [DOM API](/en-US/docs/Web/API/Document_Object_Model)
- {{domxref("Node")}}
- {{domxref("Element")}}
