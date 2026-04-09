---
title: Các tính năng bị giới hạn trong secure contexts
short-title: Tính năng bị giới hạn
slug: Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts
page-type: guide
sidebar: security
---

Tài liệu tham khảo này liệt kê các tính năng của nền tảng web chỉ khả dụng trong secure contexts - xem [Secure Contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts) để biết định nghĩa và thêm chi tiết.

## Các tính năng hiện tại chỉ khả dụng trong secure contexts

Phần này liệt kê các API mà đặc tả chỉ cho phép trong secure contexts.

- [Async Clipboard API](/en-US/docs/Web/API/Clipboard)
- {{domxref("Audio Output Devices API", "", "", "nocode")}}
- {{domxref("Background Fetch API", "", "", "nocode")}}
- {{domxref("Background Synchronization API", "", "", "nocode")}}
- {{domxref("Badging API", "", "", "nocode")}}
- {{domxref("Barcode Detection API", "", "", "nocode")}}
- {{domxref("Battery Status API", "", "", "nocode")}}
- [`Cache-Control: immutable`](/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control)
- {{domxref("Contact Picker API", "", "", "nocode")}}
- {{domxref("Content Index API", "", "", "nocode")}}
- {{domxref("Cookie Store API", "", "", "nocode")}}
- [Credential Management API](/en-US/docs/Web/API/Credential_Management_API)
- {{domxref("Device Memory API", "", "", "nocode")}}
- [Device Orientation / Device Motion](/en-US/docs/Web/API/Device_orientation_events/Detecting_device_orientation)
- {{domxref("Document Picture-in-Picture API", "", "", "nocode")}}
- [EyeDropper API](/en-US/docs/Web/API/EyeDropper)
- [Encrypted Media Extensions](/en-US/docs/Web/API/Encrypted_Media_Extensions_API)
- {{domxref("File System API", "", "", "nocode")}}
- [Generic Sensor API](https://w3c.github.io/sensors/)
- {{domxref("Gamepad API", "", "", "nocode")}}
- {{domxref("Geolocation API", "", "", "nocode")}}
- {{domxref("Idle Detection API", "", "", "nocode")}}
- {{domxref("Keyboard API", "", "", "nocode")}}
- {{domxref("Local Font Access API", "", "", "nocode")}}
- [Notifications API](/en-US/docs/Web/API/Notifications_API)
- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Presentation API](/en-US/docs/Web/API/Presentation_API)
- [Push API](/en-US/docs/Web/API/Push_API)
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
- {{domxref("Screen Capture API", "", "", "nocode")}}
- {{domxref("Screen Wake Lock API", "", "", "nocode")}}
- [Service Workers](/en-US/docs/Web/API/Service_Worker_API)
- {{domxref("Shared Storage API", "", "", "nocode")}}
- [Storage API](/en-US/docs/Web/API/Storage_API)
- [Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs)
- {{domxref("VirtualKeyboard API", "", "", "nocode")}}
- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- [Web Bluetooth](/en-US/docs/Web/API/Web_Bluetooth_API)
- {{domxref("Web Locks API", "", "", "nocode")}}
- [Web MIDI](/en-US/docs/Web/API/Web_MIDI_API)
- {{domxref("Web NFC API", "", "", "nocode")}}
- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- {{domxref("WebCodecs API", "", "", "nocode")}}
- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- {{domxref("WebHID API", "", "", "nocode")}}
- {{domxref("WebOTP API", "", "", "nocode")}}
- {{domxref("WebTransport API", "", "", "nocode")}}
- {{domxref("WebUSB API", "", "", "nocode")}}
- {{domxref("WebXR Device API", "", "", "nocode")}}
- [Web Share API](/en-US/docs/Web/API/Web_Share_API)
- {{domxref("Window Management API", "", "", "nocode")}}

Ngoài ra, các phương thức sau cũng yêu cầu secure context (ngay cả khi API liên quan không yêu cầu):

- [`MediaDevices.getUserMedia()`](/en-US/docs/Web/API/MediaDevices/getUserMedia)
- [`Navigator.registerProtocolHandler()`](/en-US/docs/Web/API/Navigator/registerProtocolHandler)

## Xem thêm

- [Secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts)
- [Truy vấn "secure context" trên Chrome Platform Status](https://chromestatus.com/features#secure%20context)
