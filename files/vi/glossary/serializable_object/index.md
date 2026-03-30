---
title: Đối tượng có thể tuần tự hóa
slug: Glossary/Serializable_object
page-type: glossary-definition
sidebar: glossarysidebar
---

**Serializable objects** (đối tượng có thể tuần tự hóa) là các đối tượng có thể được tuần tự hóa và sau đó được giải tuần tự hóa trong bất kỳ môi trường JavaScript nào ("realm"). Điều này cho phép chúng, ví dụ, được lưu trữ trên đĩa và sau đó khôi phục lại, hoặc được sao chép bằng {{DOMxRef("Window.structuredClone", "structuredClone()")}}, hoặc chia sẻ giữa các worker bằng {{domxref("DedicatedWorkerGlobalScope.postMessage()")}}.

Quá trình tuần tự hóa có thể không bao gồm tất cả các thuộc tính và các khía cạnh khác của đối tượng gốc. Ví dụ, một bản tuần tự hóa của {{domxref("DOMException")}} phải bao gồm các thuộc tính `name` và `message`, nhưng việc có bao gồm các thuộc tính khác hay không là tùy thuộc vào cách triển khai. Do đó, một đối tượng đã được giải tuần tự hóa có thể không phải là bản sao/nhân bản giống hệt của đối tượng gốc. Tuy nhiên, đối tượng mới được giải tuần tự hóa sẽ là một {{glossary("deep copy","bản sao sâu")}}, vì vậy bất kỳ thuộc tính nào được tuần tự hóa từ đối tượng gốc rồi giải tuần tự hóa vào đối tượng mới sẽ không có tham chiếu chung với đối tượng gốc.

Trong một số trường hợp khi tuần tự hóa và giải tuần tự hóa một đối tượng, việc chuyển một số tài nguyên thay vì tạo bản sao sẽ hợp lý hơn. Các đối tượng có thể chuyển như vậy được gọi là [Transferable objects](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Các đối tượng được hỗ trợ

Tất cả các giá trị nguyên thủy đều có thể tuần tự hóa. Không phải tất cả các đối tượng đều là serializable object. Các đối tượng có thể được tuần tự hóa được liệt kê tại: [Thuật toán structured clone > Các kiểu được hỗ trợ](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm#supported_types)

> [!NOTE]
> Các serializable object được đánh dấu trong [tệp Web IDL](https://github.com/w3c/webref/tree/main/ed/idl) với thuộc tính `[Serializable]`.
