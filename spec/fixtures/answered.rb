RESPONSES[:answered] = {
  :header  => [ "Content-Length: 5793", "Content-Type: text/event-plain" ],
  :content => <<-DATA
Event-Name: CHANNEL_EXECUTE_COMPLETE
Core-UUID: 0a3bd7a4-2a47-11df-8f89-ddea2631ab78
FreeSWITCH-Hostname: ubuntu
FreeSWITCH-IPv4: 172.16.150.131
FreeSWITCH-IPv6: %3A%3A1
Event-Date-Local: 2010-03-07%2016%3A39%3A02
Event-Date-GMT: Mon,%2008%20Mar%202010%2000%3A39%3A02%20GMT
Event-Date-Timestamp: 1268008742244659
Event-Calling-File: switch_core_session.c
Event-Calling-Function: switch_core_session_exec
Event-Calling-Line-Number: 1824
Channel-State: CS_EXECUTE
Channel-State-Number: 4
Channel-Name: sofia/internal/1000%40172.16.150.131
Unique-ID: f81a3fbc-2a4a-11df-8f9d-ddea2631ab78
Call-Direction: inbound
Presence-Call-Direction: inbound
Channel-Presence-ID: 1000%40172.16.150.131
Answer-State: answered
Channel-Read-Codec-Name: GSM
Channel-Read-Codec-Rate: 8000
Channel-Write-Codec-Name: GSM
Channel-Write-Codec-Rate: 8000
Caller-Username: 1000
Caller-Dialplan: XML
Caller-Caller-ID-Name: FreeSWITCH
Caller-Caller-ID-Number: 1000
Caller-Network-Addr: 172.16.150.1
Caller-ANI: 1000
Caller-Destination-Number: 502
Caller-Unique-ID: f81a3fbc-2a4a-11df-8f9d-ddea2631ab78
Caller-Source: mod_sofia
Caller-Context: default
Caller-Channel-Name: sofia/internal/1000%40172.16.150.131
Caller-Profile-Index: 1
Caller-Profile-Created-Time: 1268008732274835
Caller-Channel-Created-Time: 1268008732274835
Caller-Channel-Answered-Time: 1268008732325458
Caller-Channel-Progress-Time: 0
Caller-Channel-Progress-Media-Time: 0
Caller-Channel-Hangup-Time: 0
Caller-Channel-Transfer-Time: 0
Caller-Screen-Bit: true
Caller-Privacy-Hide-Name: false
Caller-Privacy-Hide-Number: false
variable_uuid: f81a3fbc-2a4a-11df-8f9d-ddea2631ab78
variable_sip_network_ip: 172.16.150.1
variable_sip_network_port: 61230
variable_sip_received_ip: 172.16.150.1
variable_sip_received_port: 61230
variable_sip_via_protocol: udp
variable_sip_authorized: true
variable_sip_number_alias: 1000
variable_sip_auth_username: 1000
variable_sip_auth_realm: 172.16.150.131
variable_number_alias: 1000
variable_user_name: 1000
variable_domain_name: 172.16.150.131
variable_toll_allow: domestic,international,local
variable_accountcode: 1000
variable_user_context: default
variable_effective_caller_id_name: Extension%201000
variable_effective_caller_id_number: 1000
variable_outbound_caller_id_name: FreeSWITCH
variable_outbound_caller_id_number: 0000000000
variable_callgroup: techsupport
variable_record_stereo: true
variable_default_gateway: example.com
variable_default_areacode: 918
variable_transfer_fallback_extension: operator
variable_sip_from_user: 1000
variable_sip_from_uri: 1000%40172.16.150.131
variable_sip_from_host: 172.16.150.131
variable_sip_from_user_stripped: 1000
variable_sofia_profile_name: internal
variable_sip_full_via: SIP/2.0/UDP%20192.168.20.2%3A61230%3Brport%3D61230%3Bbranch%3Dz9hG4bKPjywNOvUq.sdNaFl0hFfl2j92kst3ChkRT%3Breceived%3D172.16.150.1
variable_sip_req_user: 502
variable_sip_req_uri: 502%40172.16.150.131
variable_sip_req_host: 172.16.150.131
variable_sip_to_user: 502
variable_sip_to_uri: 502%40172.16.150.131
variable_sip_to_host: 172.16.150.131
variable_sip_contact_user: 1000
variable_sip_contact_port: 61230
variable_sip_contact_uri: 1000%40192.168.20.2%3A61230
variable_sip_contact_host: 192.168.20.2
variable_channel_name: sofia/internal/1000%40172.16.150.131
variable_sip_user_agent: Telephone%200.14.3
variable_sip_via_host: 192.168.20.2
variable_sip_via_port: 61230
variable_sip_via_rport: 61230
variable_max_forwards: 70
variable_presence_id: 1000%40172.16.150.131
variable_switch_r_sdp: v%3D0%0D%0Ao%3D-%203476997537%203476997537%20IN%20IP4%20192.168.20.2%0D%0As%3Dpjmedia%0D%0Ac%3DIN%20IP4%20192.168.20.2%0D%0At%3D0%200%0D%0Aa%3DX-nat%3A0%0D%0Am%3Daudio%204010%20RTP/AVP%20103%20102%20104%20117%203%200%208%209%20101%0D%0Aa%3Drtpmap%3A103%20speex/16000%0D%0Aa%3Drtpmap%3A102%20speex/8000%0D%0Aa%3Drtpmap%3A104%20speex/32000%0D%0Aa%3Drtpmap%3A117%20iLBC/8000%0D%0Aa%3Dfmtp%3A117%20mode%3D30%0D%0Aa%3Drtpmap%3A3%20GSM/8000%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A9%20G722/8000%0D%0Aa%3Drtpmap%3A101%20telephone-event/8000%0D%0Aa%3Dfmtp%3A101%200-15%0D%0Aa%3Drtcp%3A4011%20IN%20IP4%20192.168.20.2%0D%0A
variable_sip_use_codec_name: GSM
variable_sip_use_codec_rate: 8000
variable_sip_use_codec_ptime: 20
variable_read_codec: GSM
variable_read_rate: 8000
variable_write_codec: GSM
variable_write_rate: 8000
variable_tts_engine: cepstral
variable_tts_voice: allison
variable_socket_host: 172.16.150.1
variable_sip_local_sdp_str: v%3D0%0Ao%3DFreeSWITCH%201267985798%201267985799%20IN%20IP4%20172.16.150.131%0As%3DFreeSWITCH%0Ac%3DIN%20IP4%20172.16.150.131%0At%3D0%200%0Am%3Daudio%2022934%20RTP/AVP%203%20101%0Aa%3Drtpmap%3A3%20GSM/8000%0Aa%3Drtpmap%3A101%20telephone-event/8000%0Aa%3Dfmtp%3A101%200-16%0Aa%3DsilenceSupp%3Aoff%20-%20-%20-%20-%0Aa%3Dptime%3A20%0Aa%3Dsendrecv%0A
variable_local_media_ip: 172.16.150.131
variable_local_media_port: 22934
variable_sip_use_pt: 3
variable_rtp_use_ssrc: 2898819412
variable_sip_nat_detected: true
variable_endpoint_disposition: ANSWER
variable_sip_to_tag: gDK3D6pXtFm3e
variable_sip_from_tag: elWUmu5et-auCRPijiEAiLkCgci1M67D
variable_sip_cseq: 14587
variable_sip_call_id: bjGKd9gAHJVCxd1uVy9knG.iFWn-n2h4
variable_sip_from_display: FreeSWITCH
variable_sip_full_from: %22FreeSWITCH%22%20%3Csip%3A1000%40172.16.150.131%3E%3Btag%3DelWUmu5et-auCRPijiEAiLkCgci1M67D
variable_sip_full_to: %3Csip%3A502%40172.16.150.131%3E%3Btag%3DgDK3D6pXtFm3e
variable_remote_media_ip_reported: 192.168.20.2
variable_remote_media_ip: 172.16.150.1
variable_remote_media_port_reported: 4010
variable_remote_media_port: 4010
variable_rtp_auto_adjust: true
variable_current_application: answer
Application: answer
Application-Response: _none_
DATA
}