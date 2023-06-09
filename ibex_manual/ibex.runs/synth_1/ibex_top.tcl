# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/stefan/Desktop/Resources/ibex_manual/ibex.runs/synth_1/ibex_top.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tftg256-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/stefan/Desktop/Resources/ibex_manual/ibex.cache/wt [current_project]
set_property parent.project_path /home/stefan/Desktop/Resources/ibex_manual/ibex.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/stefan/Desktop/Resources/ibex_manual/ibex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog {
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_assert_dummy_macros.svh
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_assert_sec_cm.svh
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/dv_utils/dv_fcov_macros.svh
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_pmp_reset_default.svh
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_util_memload.svh
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_util_get_scramble_params.svh
}
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_assert_dummy_macros.svh]
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_assert_sec_cm.svh]
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/dv_utils/dv_fcov_macros.svh]
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_pmp_reset_default.svh]
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_util_memload.svh]
set_property file_type "Verilog Header" [get_files /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_util_get_scramble_params.svh]
read_verilog -library xil_defaultlib -sv {
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_alu.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_assert.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_flop_macros.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_branch_predict.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_compressed_decoder.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_controller.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_core.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_counter.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_cs_registers.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_csr.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_decoder.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_dummy_instr.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_ex_block.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_fetch_fifo.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_icache.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_id_stage.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_if_stage.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_load_store_unit.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_lockstep.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_multdiv_fast.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_multdiv_slow.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_pmp.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_prefetch_buffer.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_register_file_ff.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_register_file_fpga.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_register_file_latch.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_ram_1p_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_wb_stage.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_buf.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_cipher_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_clock_gating.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_clock_mux2.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_flop.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_generic_buf.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/ip/prim_generic/rtl/prim_generic_clock_gating.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_generic_clock_mux2.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_generic_flop.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_generic_ram_1p.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_lfsr.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_onehot_check.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_prince.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/prim/prim_ram_1p.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_util_pkg.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_ram_1p_adv.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_ram_1p_scr.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_22_16_dec.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_22_16_enc.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_28_22_dec.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_28_22_enc.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_39_32_dec.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_39_32_enc.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_hamming_22_16_dec.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_hamming_22_16_enc.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_hamming_39_32_dec.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_secded_inv_hamming_39_32_enc.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/prim_subst_perm.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/ip/prim_xilinx/rtl/prim_xilinx_clock_gating.sv
  /home/stefan/Desktop/Resources/ibex_manual/ibex.srcs/sources_1/imports/rtl/ibex_top.sv
}
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top ibex_top -part xc7a100tftg256-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ibex_top.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file ibex_top_utilization_synth.rpt -pb ibex_top_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
