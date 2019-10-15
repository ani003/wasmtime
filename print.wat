(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i64)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;7;) (func))
  (type (;8;) (func (result i32)))
  (import "wasi_unstable" "fd_prestat_get" (func $__wasi_fd_prestat_get (type 2)))
  (import "wasi_unstable" "fd_prestat_dir_name" (func $__wasi_fd_prestat_dir_name (type 0)))
  (import "wasi_unstable" "environ_sizes_get" (func $__wasi_environ_sizes_get (type 2)))
  (import "wasi_unstable" "environ_get" (func $__wasi_environ_get (type 2)))
  (import "wasi_unstable" "args_sizes_get" (func $__wasi_args_sizes_get (type 2)))
  (import "wasi_unstable" "args_get" (func $__wasi_args_get (type 2)))
  (import "wasi_unstable" "proc_exit" (func $__wasi_proc_exit (type 3)))
  (import "wasi_unstable" "fd_fdstat_get" (func $__wasi_fd_fdstat_get (type 2)))
  (import "wasi_unstable" "fd_close" (func $__wasi_fd_close (type 4)))
  (import "wasi_unstable" "fd_write" (func $__wasi_fd_write (type 5)))
  (import "wasi_unstable" "fd_seek" (func $__wasi_fd_seek (type 6)))
  (func $__wasm_call_ctors (type 7))
  (func $_start (type 7)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    call $__wasilibc_init_preopen
    i32.const 3
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              local.get 0
              call $__wasi_fd_prestat_get
              local.tee 2
              i32.const 8
              i32.eq
              br_if 1 (;@4;)
              local.get 2
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.add
                call $malloc
                local.tee 2
                i32.eqz
                br_if 4 (;@2;)
                local.get 1
                local.get 2
                local.get 0
                i32.load offset=4
                call $__wasi_fd_prestat_dir_name
                br_if 3 (;@3;)
                local.get 2
                local.get 0
                i32.load offset=4
                i32.add
                i32.const 0
                i32.store8
                local.get 1
                local.get 2
                call $__wasilibc_register_preopened_fd
                local.set 3
                local.get 2
                call $free
                local.get 3
                br_if 4 (;@2;)
              end
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 0
                i32.const 12
                i32.add
                call $__wasi_environ_sizes_get
                br_if 0 (;@6;)
                local.get 0
                i32.load
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                i32.const 0
                local.get 1
                i32.const 2
                i32.shl
                i32.const 4
                i32.add
                call $malloc
                i32.store offset=1544
                local.get 0
                i32.load offset=12
                call $malloc
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1544
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 0
                i32.load
                i32.const 2
                i32.shl
                i32.add
                i32.const 0
                i32.store
                i32.const 0
                i32.load offset=1544
                local.get 1
                call $__wasi_environ_get
                i32.eqz
                br_if 2 (;@4;)
              end
              i32.const 71
              call $_Exit
              unreachable
            end
            i32.const 0
            i32.const 0
            i32.store offset=1544
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 12
                i32.add
                local.get 0
                call $__wasi_args_sizes_get
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=12
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                local.get 1
                i32.const 2
                i32.shl
                call $malloc
                local.set 1
                local.get 0
                i32.load
                call $malloc
                local.set 2
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 2
                call $__wasi_args_get
                i32.eqz
                br_if 2 (;@4;)
              end
              i32.const 71
              call $_Exit
              unreachable
            end
          end
          call $__wasm_call_ctors
          local.get 0
          i32.load offset=12
          local.get 1
          call $main
          local.set 1
          call $__prepare_for_exit
          local.get 1
          br_if 2 (;@1;)
          local.get 0
          i32.const 16
          i32.add
          global.set 0
          return
        end
        local.get 2
        call $free
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    local.get 1
    call $_Exit
    unreachable)
  (func $__original_main (type 8) (result i32)
    i32.const 1024
    call $puts
    drop
    i32.const 0)
  (func $main (type 2) (param i32 i32) (result i32)
    call $__original_main)
  (func $malloc (type 4) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                local.get 0
                                                                                i32.const 244
                                                                                i32.gt_u
                                                                                br_if 0 (;@38;)
                                                                                i32.const 0
                                                                                i32.load offset=1040
                                                                                local.tee 2
                                                                                i32.const 16
                                                                                local.get 0
                                                                                i32.const 11
                                                                                i32.add
                                                                                i32.const -8
                                                                                i32.and
                                                                                local.get 0
                                                                                i32.const 11
                                                                                i32.lt_u
                                                                                select
                                                                                local.tee 3
                                                                                i32.const 3
                                                                                i32.shr_u
                                                                                local.tee 4
                                                                                i32.shr_u
                                                                                local.tee 0
                                                                                i32.const 3
                                                                                i32.and
                                                                                i32.eqz
                                                                                br_if 1 (;@37;)
                                                                                local.get 0
                                                                                i32.const -1
                                                                                i32.xor
                                                                                i32.const 1
                                                                                i32.and
                                                                                local.get 4
                                                                                i32.add
                                                                                local.tee 5
                                                                                i32.const 3
                                                                                i32.shl
                                                                                local.tee 6
                                                                                i32.const 1088
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 4
                                                                                i32.const 8
                                                                                i32.add
                                                                                local.set 0
                                                                                local.get 4
                                                                                i32.load offset=8
                                                                                local.tee 3
                                                                                local.get 6
                                                                                i32.const 1080
                                                                                i32.add
                                                                                local.tee 6
                                                                                i32.eq
                                                                                br_if 2 (;@36;)
                                                                                local.get 3
                                                                                local.get 6
                                                                                i32.store offset=12
                                                                                local.get 6
                                                                                i32.const 8
                                                                                i32.add
                                                                                local.get 3
                                                                                i32.store
                                                                                br 3 (;@35;)
                                                                              end
                                                                              i32.const -1
                                                                              local.set 3
                                                                              local.get 0
                                                                              i32.const -65
                                                                              i32.gt_u
                                                                              br_if 14 (;@23;)
                                                                              local.get 0
                                                                              i32.const 11
                                                                              i32.add
                                                                              local.tee 0
                                                                              i32.const -8
                                                                              i32.and
                                                                              local.set 3
                                                                              i32.const 0
                                                                              i32.load offset=1044
                                                                              local.tee 7
                                                                              i32.eqz
                                                                              br_if 14 (;@23;)
                                                                              i32.const 0
                                                                              local.set 8
                                                                              block  ;; label = @38
                                                                                local.get 0
                                                                                i32.const 8
                                                                                i32.shr_u
                                                                                local.tee 0
                                                                                i32.eqz
                                                                                br_if 0 (;@38;)
                                                                                i32.const 31
                                                                                local.set 8
                                                                                local.get 3
                                                                                i32.const 16777215
                                                                                i32.gt_u
                                                                                br_if 0 (;@38;)
                                                                                local.get 3
                                                                                i32.const 14
                                                                                local.get 0
                                                                                local.get 0
                                                                                i32.const 1048320
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 8
                                                                                i32.and
                                                                                local.tee 4
                                                                                i32.shl
                                                                                local.tee 0
                                                                                i32.const 520192
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 4
                                                                                i32.and
                                                                                local.tee 5
                                                                                local.get 4
                                                                                i32.or
                                                                                local.get 0
                                                                                local.get 5
                                                                                i32.shl
                                                                                local.tee 0
                                                                                i32.const 245760
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.shr_u
                                                                                i32.const 2
                                                                                i32.and
                                                                                local.tee 4
                                                                                i32.or
                                                                                i32.sub
                                                                                local.get 0
                                                                                local.get 4
                                                                                i32.shl
                                                                                i32.const 15
                                                                                i32.shr_u
                                                                                i32.add
                                                                                local.tee 0
                                                                                i32.const 7
                                                                                i32.add
                                                                                i32.shr_u
                                                                                i32.const 1
                                                                                i32.and
                                                                                local.get 0
                                                                                i32.const 1
                                                                                i32.shl
                                                                                i32.or
                                                                                local.set 8
                                                                              end
                                                                              i32.const 0
                                                                              local.get 3
                                                                              i32.sub
                                                                              local.set 5
                                                                              local.get 8
                                                                              i32.const 2
                                                                              i32.shl
                                                                              i32.const 1344
                                                                              i32.add
                                                                              i32.load
                                                                              local.tee 4
                                                                              i32.eqz
                                                                              br_if 3 (;@34;)
                                                                              local.get 3
                                                                              i32.const 0
                                                                              i32.const 25
                                                                              local.get 8
                                                                              i32.const 1
                                                                              i32.shr_u
                                                                              i32.sub
                                                                              local.get 8
                                                                              i32.const 31
                                                                              i32.eq
                                                                              select
                                                                              i32.shl
                                                                              local.set 6
                                                                              i32.const 0
                                                                              local.set 0
                                                                              i32.const 0
                                                                              local.set 9
                                                                              loop  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  local.get 4
                                                                                  i32.load offset=4
                                                                                  i32.const -8
                                                                                  i32.and
                                                                                  local.get 3
                                                                                  i32.sub
                                                                                  local.tee 2
                                                                                  local.get 5
                                                                                  i32.ge_u
                                                                                  br_if 0 (;@39;)
                                                                                  local.get 2
                                                                                  local.set 5
                                                                                  local.get 4
                                                                                  local.set 9
                                                                                  local.get 2
                                                                                  i32.eqz
                                                                                  br_if 8 (;@31;)
                                                                                end
                                                                                local.get 0
                                                                                local.get 4
                                                                                i32.const 20
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 2
                                                                                local.get 2
                                                                                local.get 4
                                                                                local.get 6
                                                                                i32.const 29
                                                                                i32.shr_u
                                                                                i32.const 4
                                                                                i32.and
                                                                                i32.add
                                                                                i32.const 16
                                                                                i32.add
                                                                                i32.load
                                                                                local.tee 4
                                                                                i32.eq
                                                                                select
                                                                                local.get 0
                                                                                local.get 2
                                                                                select
                                                                                local.set 0
                                                                                local.get 6
                                                                                local.get 4
                                                                                i32.const 0
                                                                                i32.ne
                                                                                i32.shl
                                                                                local.set 6
                                                                                local.get 4
                                                                                br_if 0 (;@38;)
                                                                              end
                                                                              local.get 0
                                                                              local.get 9
                                                                              i32.or
                                                                              i32.eqz
                                                                              br_if 4 (;@33;)
                                                                              br 11 (;@26;)
                                                                            end
                                                                            local.get 3
                                                                            i32.const 0
                                                                            i32.load offset=1048
                                                                            local.tee 7
                                                                            i32.le_u
                                                                            br_if 13 (;@23;)
                                                                            local.get 0
                                                                            i32.eqz
                                                                            br_if 4 (;@32;)
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shl
                                                                            i32.const 2
                                                                            local.get 4
                                                                            i32.shl
                                                                            local.tee 0
                                                                            i32.const 0
                                                                            local.get 0
                                                                            i32.sub
                                                                            i32.or
                                                                            i32.and
                                                                            local.tee 0
                                                                            i32.const 0
                                                                            local.get 0
                                                                            i32.sub
                                                                            i32.and
                                                                            i32.const -1
                                                                            i32.add
                                                                            local.tee 0
                                                                            local.get 0
                                                                            i32.const 12
                                                                            i32.shr_u
                                                                            i32.const 16
                                                                            i32.and
                                                                            local.tee 0
                                                                            i32.shr_u
                                                                            local.tee 4
                                                                            i32.const 5
                                                                            i32.shr_u
                                                                            i32.const 8
                                                                            i32.and
                                                                            local.tee 5
                                                                            local.get 0
                                                                            i32.or
                                                                            local.get 4
                                                                            local.get 5
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 2
                                                                            i32.shr_u
                                                                            i32.const 4
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 1
                                                                            i32.shr_u
                                                                            i32.const 2
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            local.tee 0
                                                                            i32.const 1
                                                                            i32.shr_u
                                                                            i32.const 1
                                                                            i32.and
                                                                            local.tee 4
                                                                            i32.or
                                                                            local.get 0
                                                                            local.get 4
                                                                            i32.shr_u
                                                                            i32.add
                                                                            local.tee 5
                                                                            i32.const 3
                                                                            i32.shl
                                                                            local.tee 6
                                                                            i32.const 1088
                                                                            i32.add
                                                                            i32.load
                                                                            local.tee 4
                                                                            i32.load offset=8
                                                                            local.tee 0
                                                                            local.get 6
                                                                            i32.const 1080
                                                                            i32.add
                                                                            local.tee 6
                                                                            i32.eq
                                                                            br_if 6 (;@30;)
                                                                            local.get 0
                                                                            local.get 6
                                                                            i32.store offset=12
                                                                            local.get 6
                                                                            i32.const 8
                                                                            i32.add
                                                                            local.get 0
                                                                            i32.store
                                                                            br 7 (;@29;)
                                                                          end
                                                                          i32.const 0
                                                                          local.get 2
                                                                          i32.const -2
                                                                          local.get 5
                                                                          i32.rotl
                                                                          i32.and
                                                                          i32.store offset=1040
                                                                        end
                                                                        local.get 4
                                                                        local.get 5
                                                                        i32.const 3
                                                                        i32.shl
                                                                        local.tee 5
                                                                        i32.const 3
                                                                        i32.or
                                                                        i32.store offset=4
                                                                        local.get 4
                                                                        local.get 5
                                                                        i32.add
                                                                        local.tee 4
                                                                        local.get 4
                                                                        i32.load offset=4
                                                                        i32.const 1
                                                                        i32.or
                                                                        i32.store offset=4
                                                                        br 33 (;@1;)
                                                                      end
                                                                      i32.const 0
                                                                      local.set 0
                                                                      i32.const 0
                                                                      local.set 9
                                                                      i32.const 0
                                                                      i32.const 0
                                                                      i32.or
                                                                      br_if 7 (;@26;)
                                                                    end
                                                                    i32.const 2
                                                                    local.get 8
                                                                    i32.shl
                                                                    local.tee 0
                                                                    i32.const 0
                                                                    local.get 0
                                                                    i32.sub
                                                                    i32.or
                                                                    local.get 7
                                                                    i32.and
                                                                    local.tee 0
                                                                    i32.eqz
                                                                    br_if 9 (;@23;)
                                                                    local.get 0
                                                                    i32.const 0
                                                                    local.get 0
                                                                    i32.sub
                                                                    i32.and
                                                                    i32.const -1
                                                                    i32.add
                                                                    local.tee 0
                                                                    local.get 0
                                                                    i32.const 12
                                                                    i32.shr_u
                                                                    i32.const 16
                                                                    i32.and
                                                                    local.tee 0
                                                                    i32.shr_u
                                                                    local.tee 4
                                                                    i32.const 5
                                                                    i32.shr_u
                                                                    i32.const 8
                                                                    i32.and
                                                                    local.tee 6
                                                                    local.get 0
                                                                    i32.or
                                                                    local.get 4
                                                                    local.get 6
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 2
                                                                    i32.shr_u
                                                                    i32.const 4
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 1
                                                                    i32.shr_u
                                                                    i32.const 2
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    local.tee 0
                                                                    i32.const 1
                                                                    i32.shr_u
                                                                    i32.const 1
                                                                    i32.and
                                                                    local.tee 4
                                                                    i32.or
                                                                    local.get 0
                                                                    local.get 4
                                                                    i32.shr_u
                                                                    i32.add
                                                                    i32.const 2
                                                                    i32.shl
                                                                    i32.const 1344
                                                                    i32.add
                                                                    i32.load
                                                                    local.tee 0
                                                                    br_if 7 (;@25;)
                                                                    br 8 (;@24;)
                                                                  end
                                                                  i32.const 0
                                                                  i32.load offset=1044
                                                                  local.tee 10
                                                                  i32.eqz
                                                                  br_if 8 (;@23;)
                                                                  local.get 10
                                                                  i32.const 0
                                                                  local.get 10
                                                                  i32.sub
                                                                  i32.and
                                                                  i32.const -1
                                                                  i32.add
                                                                  local.tee 0
                                                                  local.get 0
                                                                  i32.const 12
                                                                  i32.shr_u
                                                                  i32.const 16
                                                                  i32.and
                                                                  local.tee 0
                                                                  i32.shr_u
                                                                  local.tee 4
                                                                  i32.const 5
                                                                  i32.shr_u
                                                                  i32.const 8
                                                                  i32.and
                                                                  local.tee 5
                                                                  local.get 0
                                                                  i32.or
                                                                  local.get 4
                                                                  local.get 5
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 2
                                                                  i32.shr_u
                                                                  i32.const 4
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 1
                                                                  i32.shr_u
                                                                  i32.const 2
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  local.tee 0
                                                                  i32.const 1
                                                                  i32.shr_u
                                                                  i32.const 1
                                                                  i32.and
                                                                  local.tee 4
                                                                  i32.or
                                                                  local.get 0
                                                                  local.get 4
                                                                  i32.shr_u
                                                                  i32.add
                                                                  i32.const 2
                                                                  i32.shl
                                                                  i32.const 1344
                                                                  i32.add
                                                                  i32.load
                                                                  local.tee 6
                                                                  i32.load offset=4
                                                                  i32.const -8
                                                                  i32.and
                                                                  local.get 3
                                                                  i32.sub
                                                                  local.set 5
                                                                  local.get 6
                                                                  local.tee 9
                                                                  i32.load offset=16
                                                                  local.tee 0
                                                                  i32.eqz
                                                                  br_if 3 (;@28;)
                                                                  i32.const 1
                                                                  local.set 4
                                                                  br 4 (;@27;)
                                                                end
                                                                i32.const 0
                                                                local.set 5
                                                                local.get 4
                                                                local.set 9
                                                                local.get 4
                                                                local.set 0
                                                                br 5 (;@25;)
                                                              end
                                                              i32.const 0
                                                              local.get 2
                                                              i32.const -2
                                                              local.get 5
                                                              i32.rotl
                                                              i32.and
                                                              local.tee 2
                                                              i32.store offset=1040
                                                            end
                                                            local.get 4
                                                            i32.const 8
                                                            i32.add
                                                            local.set 0
                                                            local.get 4
                                                            local.get 3
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 4
                                                            local.get 5
                                                            i32.const 3
                                                            i32.shl
                                                            local.tee 5
                                                            i32.add
                                                            local.get 5
                                                            local.get 3
                                                            i32.sub
                                                            local.tee 5
                                                            i32.store
                                                            local.get 4
                                                            local.get 3
                                                            i32.add
                                                            local.tee 6
                                                            local.get 5
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            block  ;; label = @29
                                                              local.get 7
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 7
                                                              i32.const 3
                                                              i32.shr_u
                                                              local.tee 9
                                                              i32.const 3
                                                              i32.shl
                                                              i32.const 1080
                                                              i32.add
                                                              local.set 3
                                                              i32.const 0
                                                              i32.load offset=1060
                                                              local.set 4
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  local.get 2
                                                                  i32.const 1
                                                                  local.get 9
                                                                  i32.shl
                                                                  local.tee 9
                                                                  i32.and
                                                                  i32.eqz
                                                                  br_if 0 (;@31;)
                                                                  local.get 3
                                                                  i32.load offset=8
                                                                  local.set 9
                                                                  br 1 (;@30;)
                                                                end
                                                                i32.const 0
                                                                local.get 2
                                                                local.get 9
                                                                i32.or
                                                                i32.store offset=1040
                                                                local.get 3
                                                                local.set 9
                                                              end
                                                              local.get 9
                                                              local.get 4
                                                              i32.store offset=12
                                                              local.get 3
                                                              local.get 4
                                                              i32.store offset=8
                                                              local.get 4
                                                              local.get 3
                                                              i32.store offset=12
                                                              local.get 4
                                                              local.get 9
                                                              i32.store offset=8
                                                            end
                                                            i32.const 0
                                                            local.get 6
                                                            i32.store offset=1060
                                                            i32.const 0
                                                            local.get 5
                                                            i32.store offset=1048
                                                            br 27 (;@1;)
                                                          end
                                                          i32.const 0
                                                          local.set 4
                                                        end
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            loop  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      local.get 4
                                                                      br_table 1 (;@32;) 0 (;@33;) 0 (;@33;)
                                                                    end
                                                                    local.get 0
                                                                    i32.load offset=4
                                                                    i32.const -8
                                                                    i32.and
                                                                    local.get 3
                                                                    i32.sub
                                                                    local.tee 4
                                                                    local.get 5
                                                                    local.get 4
                                                                    local.get 5
                                                                    i32.lt_u
                                                                    local.tee 4
                                                                    select
                                                                    local.set 5
                                                                    local.get 0
                                                                    local.get 6
                                                                    local.get 4
                                                                    select
                                                                    local.set 6
                                                                    local.get 0
                                                                    local.tee 9
                                                                    i32.load offset=16
                                                                    local.tee 0
                                                                    br_if 1 (;@31;)
                                                                    i32.const 0
                                                                    local.set 4
                                                                    br 3 (;@29;)
                                                                  end
                                                                  local.get 9
                                                                  i32.const 20
                                                                  i32.add
                                                                  i32.load
                                                                  local.tee 0
                                                                  br_if 1 (;@30;)
                                                                  local.get 6
                                                                  local.get 3
                                                                  i32.add
                                                                  local.tee 11
                                                                  local.get 6
                                                                  i32.le_u
                                                                  br_if 8 (;@23;)
                                                                  local.get 6
                                                                  i32.load offset=24
                                                                  local.set 12
                                                                  block  ;; label = @32
                                                                    local.get 6
                                                                    i32.load offset=12
                                                                    local.tee 9
                                                                    local.get 6
                                                                    i32.eq
                                                                    br_if 0 (;@32;)
                                                                    local.get 6
                                                                    i32.load offset=8
                                                                    local.tee 0
                                                                    local.get 9
                                                                    i32.store offset=12
                                                                    local.get 9
                                                                    local.get 0
                                                                    i32.store offset=8
                                                                    local.get 12
                                                                    br_if 4 (;@28;)
                                                                    br 5 (;@27;)
                                                                  end
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      local.get 6
                                                                      i32.const 20
                                                                      i32.add
                                                                      local.tee 4
                                                                      i32.load
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                      local.get 6
                                                                      i32.load offset=16
                                                                      local.tee 0
                                                                      i32.eqz
                                                                      br_if 1 (;@32;)
                                                                      local.get 6
                                                                      i32.const 16
                                                                      i32.add
                                                                      local.set 4
                                                                    end
                                                                    loop  ;; label = @33
                                                                      local.get 4
                                                                      local.set 8
                                                                      local.get 0
                                                                      local.tee 9
                                                                      i32.const 20
                                                                      i32.add
                                                                      local.tee 4
                                                                      i32.load
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                      local.get 9
                                                                      i32.const 16
                                                                      i32.add
                                                                      local.set 4
                                                                      local.get 9
                                                                      i32.load offset=16
                                                                      local.tee 0
                                                                      br_if 0 (;@33;)
                                                                    end
                                                                    local.get 8
                                                                    i32.const 0
                                                                    i32.store
                                                                    local.get 12
                                                                    i32.eqz
                                                                    br_if 5 (;@27;)
                                                                    br 4 (;@28;)
                                                                  end
                                                                  i32.const 0
                                                                  local.set 9
                                                                  local.get 12
                                                                  br_if 3 (;@28;)
                                                                  br 4 (;@27;)
                                                                end
                                                                i32.const 1
                                                                local.set 4
                                                                br 1 (;@29;)
                                                              end
                                                              i32.const 1
                                                              local.set 4
                                                              br 0 (;@29;)
                                                            end
                                                          end
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                local.get 6
                                                                local.get 6
                                                                i32.load offset=28
                                                                local.tee 4
                                                                i32.const 2
                                                                i32.shl
                                                                i32.const 1344
                                                                i32.add
                                                                local.tee 0
                                                                i32.load
                                                                i32.eq
                                                                br_if 0 (;@30;)
                                                                local.get 12
                                                                i32.const 16
                                                                i32.const 20
                                                                local.get 12
                                                                i32.load offset=16
                                                                local.get 6
                                                                i32.eq
                                                                select
                                                                i32.add
                                                                local.get 9
                                                                i32.store
                                                                local.get 9
                                                                br_if 1 (;@29;)
                                                                br 3 (;@27;)
                                                              end
                                                              local.get 0
                                                              local.get 9
                                                              i32.store
                                                              local.get 9
                                                              i32.eqz
                                                              br_if 1 (;@28;)
                                                            end
                                                            local.get 9
                                                            local.get 12
                                                            i32.store offset=24
                                                            block  ;; label = @29
                                                              local.get 6
                                                              i32.load offset=16
                                                              local.tee 0
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 9
                                                              local.get 0
                                                              i32.store offset=16
                                                              local.get 0
                                                              local.get 9
                                                              i32.store offset=24
                                                            end
                                                            local.get 6
                                                            i32.const 20
                                                            i32.add
                                                            i32.load
                                                            local.tee 0
                                                            i32.eqz
                                                            br_if 1 (;@27;)
                                                            local.get 9
                                                            i32.const 20
                                                            i32.add
                                                            local.get 0
                                                            i32.store
                                                            local.get 0
                                                            local.get 9
                                                            i32.store offset=24
                                                            br 1 (;@27;)
                                                          end
                                                          i32.const 0
                                                          local.get 10
                                                          i32.const -2
                                                          local.get 4
                                                          i32.rotl
                                                          i32.and
                                                          i32.store offset=1044
                                                        end
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            local.get 5
                                                            i32.const 15
                                                            i32.gt_u
                                                            br_if 0 (;@28;)
                                                            local.get 6
                                                            local.get 5
                                                            local.get 3
                                                            i32.add
                                                            local.tee 0
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 6
                                                            local.get 0
                                                            i32.add
                                                            local.tee 0
                                                            local.get 0
                                                            i32.load offset=4
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            br 1 (;@27;)
                                                          end
                                                          local.get 11
                                                          local.get 5
                                                          i32.const 1
                                                          i32.or
                                                          i32.store offset=4
                                                          local.get 6
                                                          local.get 3
                                                          i32.const 3
                                                          i32.or
                                                          i32.store offset=4
                                                          local.get 11
                                                          local.get 5
                                                          i32.add
                                                          local.get 5
                                                          i32.store
                                                          block  ;; label = @28
                                                            local.get 7
                                                            i32.eqz
                                                            br_if 0 (;@28;)
                                                            local.get 7
                                                            i32.const 3
                                                            i32.shr_u
                                                            local.tee 3
                                                            i32.const 3
                                                            i32.shl
                                                            i32.const 1080
                                                            i32.add
                                                            local.set 4
                                                            i32.const 0
                                                            i32.load offset=1060
                                                            local.set 0
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                i32.const 1
                                                                local.get 3
                                                                i32.shl
                                                                local.tee 3
                                                                local.get 2
                                                                i32.and
                                                                i32.eqz
                                                                br_if 0 (;@30;)
                                                                local.get 4
                                                                i32.load offset=8
                                                                local.set 3
                                                                br 1 (;@29;)
                                                              end
                                                              i32.const 0
                                                              local.get 3
                                                              local.get 2
                                                              i32.or
                                                              i32.store offset=1040
                                                              local.get 4
                                                              local.set 3
                                                            end
                                                            local.get 3
                                                            local.get 0
                                                            i32.store offset=12
                                                            local.get 4
                                                            local.get 0
                                                            i32.store offset=8
                                                            local.get 0
                                                            local.get 4
                                                            i32.store offset=12
                                                            local.get 0
                                                            local.get 3
                                                            i32.store offset=8
                                                          end
                                                          i32.const 0
                                                          local.get 11
                                                          i32.store offset=1060
                                                          i32.const 0
                                                          local.get 5
                                                          i32.store offset=1048
                                                        end
                                                        local.get 6
                                                        i32.const 8
                                                        i32.add
                                                        local.set 0
                                                        br 25 (;@1;)
                                                      end
                                                      local.get 0
                                                      i32.eqz
                                                      br_if 1 (;@24;)
                                                    end
                                                    loop  ;; label = @25
                                                      local.get 0
                                                      i32.load offset=4
                                                      i32.const -8
                                                      i32.and
                                                      local.get 3
                                                      i32.sub
                                                      local.tee 2
                                                      local.get 5
                                                      i32.lt_u
                                                      local.set 6
                                                      block  ;; label = @26
                                                        local.get 0
                                                        i32.load offset=16
                                                        local.tee 4
                                                        br_if 0 (;@26;)
                                                        local.get 0
                                                        i32.const 20
                                                        i32.add
                                                        i32.load
                                                        local.set 4
                                                      end
                                                      local.get 2
                                                      local.get 5
                                                      local.get 6
                                                      select
                                                      local.set 5
                                                      local.get 0
                                                      local.get 9
                                                      local.get 6
                                                      select
                                                      local.set 9
                                                      local.get 4
                                                      local.set 0
                                                      local.get 4
                                                      br_if 0 (;@25;)
                                                    end
                                                  end
                                                  local.get 9
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 5
                                                  i32.const 0
                                                  i32.load offset=1048
                                                  local.get 3
                                                  i32.sub
                                                  i32.ge_u
                                                  br_if 0 (;@23;)
                                                  local.get 9
                                                  local.get 3
                                                  i32.add
                                                  local.tee 8
                                                  local.get 9
                                                  i32.le_u
                                                  br_if 0 (;@23;)
                                                  local.get 9
                                                  i32.load offset=24
                                                  local.set 10
                                                  local.get 9
                                                  i32.load offset=12
                                                  local.tee 6
                                                  local.get 9
                                                  i32.eq
                                                  br_if 1 (;@22;)
                                                  local.get 9
                                                  i32.load offset=8
                                                  local.tee 0
                                                  local.get 6
                                                  i32.store offset=12
                                                  local.get 6
                                                  local.get 0
                                                  i32.store offset=8
                                                  local.get 10
                                                  br_if 20 (;@3;)
                                                  br 21 (;@2;)
                                                end
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            i32.const 0
                                                            i32.load offset=1048
                                                            local.tee 0
                                                            local.get 3
                                                            i32.ge_u
                                                            br_if 0 (;@28;)
                                                            i32.const 0
                                                            i32.load offset=1052
                                                            local.tee 6
                                                            local.get 3
                                                            i32.le_u
                                                            br_if 1 (;@27;)
                                                            i32.const 0
                                                            i32.load offset=1064
                                                            local.tee 0
                                                            local.get 3
                                                            i32.add
                                                            local.tee 4
                                                            local.get 6
                                                            local.get 3
                                                            i32.sub
                                                            local.tee 5
                                                            i32.const 1
                                                            i32.or
                                                            i32.store offset=4
                                                            i32.const 0
                                                            local.get 5
                                                            i32.store offset=1052
                                                            i32.const 0
                                                            local.get 4
                                                            i32.store offset=1064
                                                            local.get 0
                                                            local.get 3
                                                            i32.const 3
                                                            i32.or
                                                            i32.store offset=4
                                                            local.get 0
                                                            i32.const 8
                                                            i32.add
                                                            local.set 0
                                                            br 27 (;@1;)
                                                          end
                                                          i32.const 0
                                                          i32.load offset=1060
                                                          local.set 4
                                                          local.get 0
                                                          local.get 3
                                                          i32.sub
                                                          local.tee 5
                                                          i32.const 16
                                                          i32.lt_u
                                                          br_if 1 (;@26;)
                                                          local.get 4
                                                          local.get 3
                                                          i32.add
                                                          local.tee 6
                                                          local.get 5
                                                          i32.const 1
                                                          i32.or
                                                          i32.store offset=4
                                                          i32.const 0
                                                          local.get 5
                                                          i32.store offset=1048
                                                          i32.const 0
                                                          local.get 6
                                                          i32.store offset=1060
                                                          local.get 4
                                                          local.get 0
                                                          i32.add
                                                          local.get 5
                                                          i32.store
                                                          local.get 4
                                                          local.get 3
                                                          i32.const 3
                                                          i32.or
                                                          i32.store offset=4
                                                          br 2 (;@25;)
                                                        end
                                                        i32.const 0
                                                        i32.load offset=1512
                                                        i32.eqz
                                                        br_if 2 (;@24;)
                                                        i32.const 0
                                                        i32.load offset=1520
                                                        local.set 4
                                                        br 3 (;@23;)
                                                      end
                                                      local.get 4
                                                      local.get 0
                                                      i32.const 3
                                                      i32.or
                                                      i32.store offset=4
                                                      local.get 4
                                                      local.get 0
                                                      i32.add
                                                      local.tee 0
                                                      local.get 0
                                                      i32.load offset=4
                                                      i32.const 1
                                                      i32.or
                                                      i32.store offset=4
                                                      i32.const 0
                                                      i32.const 0
                                                      i32.store offset=1060
                                                      i32.const 0
                                                      i32.const 0
                                                      i32.store offset=1048
                                                    end
                                                    local.get 4
                                                    i32.const 8
                                                    i32.add
                                                    local.set 0
                                                    br 23 (;@1;)
                                                  end
                                                  i32.const 0
                                                  i64.const -1
                                                  i64.store offset=1524 align=4
                                                  i32.const 0
                                                  i64.const 281474976776192
                                                  i64.store offset=1516 align=4
                                                  i32.const 0
                                                  local.get 1
                                                  i32.const 12
                                                  i32.add
                                                  i32.const -16
                                                  i32.and
                                                  i32.const 1431655768
                                                  i32.xor
                                                  i32.store offset=1512
                                                  i32.const 0
                                                  i32.const 0
                                                  i32.store offset=1532
                                                  i32.const 0
                                                  i32.const 0
                                                  i32.store offset=1484
                                                  i32.const 65536
                                                  local.set 4
                                                end
                                                i32.const 0
                                                local.set 0
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 4
                                                    local.get 3
                                                    i32.const 47
                                                    i32.add
                                                    local.tee 7
                                                    i32.add
                                                    local.tee 2
                                                    i32.const 0
                                                    local.get 4
                                                    i32.sub
                                                    local.tee 8
                                                    i32.and
                                                    local.tee 9
                                                    local.get 3
                                                    i32.le_u
                                                    br_if 0 (;@24;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=1480
                                                      local.tee 0
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 0
                                                      i32.load offset=1472
                                                      local.tee 4
                                                      local.get 9
                                                      i32.add
                                                      local.tee 5
                                                      local.get 4
                                                      i32.le_u
                                                      br_if 2 (;@23;)
                                                      local.get 5
                                                      local.get 0
                                                      i32.gt_u
                                                      br_if 2 (;@23;)
                                                    end
                                                    i32.const 0
                                                    i32.load8_u offset=1484
                                                    i32.const 4
                                                    i32.and
                                                    br_if 10 (;@14;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=1064
                                                      local.tee 4
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 1488
                                                      local.set 0
                                                      loop  ;; label = @26
                                                        block  ;; label = @27
                                                          local.get 0
                                                          i32.load
                                                          local.tee 5
                                                          local.get 4
                                                          i32.gt_u
                                                          br_if 0 (;@27;)
                                                          local.get 5
                                                          local.get 0
                                                          i32.load offset=4
                                                          i32.add
                                                          local.get 4
                                                          i32.gt_u
                                                          br_if 6 (;@21;)
                                                        end
                                                        local.get 0
                                                        i32.load offset=8
                                                        local.tee 0
                                                        br_if 0 (;@26;)
                                                      end
                                                    end
                                                    i32.const 0
                                                    call $sbrk
                                                    local.tee 6
                                                    i32.const -1
                                                    i32.eq
                                                    br_if 9 (;@15;)
                                                    local.get 9
                                                    local.set 2
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=1516
                                                      local.tee 0
                                                      i32.const -1
                                                      i32.add
                                                      local.tee 4
                                                      local.get 6
                                                      i32.and
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 9
                                                      local.get 6
                                                      i32.sub
                                                      local.get 4
                                                      local.get 6
                                                      i32.add
                                                      i32.const 0
                                                      local.get 0
                                                      i32.sub
                                                      i32.and
                                                      i32.add
                                                      local.set 2
                                                    end
                                                    local.get 2
                                                    local.get 3
                                                    i32.le_u
                                                    br_if 9 (;@15;)
                                                    local.get 2
                                                    i32.const 2147483646
                                                    i32.gt_u
                                                    br_if 9 (;@15;)
                                                    block  ;; label = @25
                                                      i32.const 0
                                                      i32.load offset=1480
                                                      local.tee 0
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 0
                                                      i32.load offset=1472
                                                      local.tee 4
                                                      local.get 2
                                                      i32.add
                                                      local.tee 5
                                                      local.get 4
                                                      i32.le_u
                                                      br_if 10 (;@15;)
                                                      local.get 5
                                                      local.get 0
                                                      i32.gt_u
                                                      br_if 10 (;@15;)
                                                    end
                                                    local.get 2
                                                    call $sbrk
                                                    local.tee 0
                                                    local.get 6
                                                    i32.ne
                                                    br_if 4 (;@20;)
                                                    br 11 (;@13;)
                                                  end
                                                  i32.const 0
                                                  i32.const 48
                                                  i32.store offset=1536
                                                  br 22 (;@1;)
                                                end
                                                i32.const 0
                                                local.set 0
                                                i32.const 0
                                                i32.const 48
                                                i32.store offset=1536
                                                br 21 (;@1;)
                                              end
                                              block  ;; label = @22
                                                local.get 9
                                                i32.const 20
                                                i32.add
                                                local.tee 4
                                                i32.load
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                local.get 9
                                                i32.load offset=16
                                                local.tee 0
                                                i32.eqz
                                                br_if 3 (;@19;)
                                                local.get 9
                                                i32.const 16
                                                i32.add
                                                local.set 4
                                              end
                                              loop  ;; label = @22
                                                local.get 4
                                                local.set 2
                                                local.get 0
                                                local.tee 6
                                                i32.const 20
                                                i32.add
                                                local.tee 4
                                                i32.load
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                local.get 6
                                                i32.const 16
                                                i32.add
                                                local.set 4
                                                local.get 6
                                                i32.load offset=16
                                                local.tee 0
                                                br_if 0 (;@22;)
                                              end
                                              local.get 2
                                              i32.const 0
                                              i32.store
                                              local.get 10
                                              i32.eqz
                                              br_if 19 (;@2;)
                                              br 18 (;@3;)
                                            end
                                            local.get 2
                                            local.get 6
                                            i32.sub
                                            local.get 8
                                            i32.and
                                            local.tee 2
                                            i32.const 2147483646
                                            i32.gt_u
                                            br_if 5 (;@15;)
                                            local.get 2
                                            call $sbrk
                                            local.tee 6
                                            local.get 0
                                            i32.load
                                            local.get 0
                                            i32.load offset=4
                                            i32.add
                                            i32.eq
                                            br_if 3 (;@17;)
                                            local.get 6
                                            local.set 0
                                          end
                                          local.get 0
                                          local.set 6
                                          local.get 3
                                          i32.const 48
                                          i32.add
                                          local.get 2
                                          i32.le_u
                                          br_if 1 (;@18;)
                                          local.get 2
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 1 (;@18;)
                                          local.get 6
                                          i32.const -1
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 7
                                          local.get 2
                                          i32.sub
                                          i32.const 0
                                          i32.load offset=1520
                                          local.tee 0
                                          i32.add
                                          i32.const 0
                                          local.get 0
                                          i32.sub
                                          i32.and
                                          local.tee 0
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 6 (;@13;)
                                          local.get 0
                                          call $sbrk
                                          i32.const -1
                                          i32.eq
                                          br_if 3 (;@16;)
                                          local.get 0
                                          local.get 2
                                          i32.add
                                          local.set 2
                                          br 6 (;@13;)
                                        end
                                        i32.const 0
                                        local.set 6
                                        local.get 10
                                        br_if 15 (;@3;)
                                        br 16 (;@2;)
                                      end
                                      local.get 6
                                      i32.const -1
                                      i32.ne
                                      br_if 4 (;@13;)
                                      br 2 (;@15;)
                                    end
                                    local.get 6
                                    i32.const -1
                                    i32.ne
                                    br_if 3 (;@13;)
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.get 2
                                  i32.sub
                                  call $sbrk
                                  drop
                                end
                                i32.const 0
                                i32.const 0
                                i32.load offset=1484
                                i32.const 4
                                i32.or
                                i32.store offset=1484
                              end
                              local.get 9
                              i32.const 2147483646
                              i32.gt_u
                              br_if 1 (;@12;)
                              local.get 9
                              call $sbrk
                              local.tee 6
                              i32.const 0
                              call $sbrk
                              local.tee 0
                              i32.ge_u
                              br_if 1 (;@12;)
                              local.get 6
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              local.get 6
                              i32.sub
                              local.tee 2
                              local.get 3
                              i32.const 40
                              i32.add
                              i32.le_u
                              br_if 1 (;@12;)
                            end
                            i32.const 0
                            i32.const 0
                            i32.load offset=1472
                            local.get 2
                            i32.add
                            local.tee 0
                            i32.store offset=1472
                            block  ;; label = @13
                              local.get 0
                              i32.const 0
                              i32.load offset=1476
                              i32.le_u
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 0
                              i32.store offset=1476
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    i32.const 0
                                    i32.load offset=1064
                                    local.tee 4
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 1488
                                    local.set 0
                                    loop  ;; label = @17
                                      local.get 6
                                      local.get 0
                                      i32.load
                                      local.tee 5
                                      local.get 0
                                      i32.load offset=4
                                      local.tee 9
                                      i32.add
                                      i32.eq
                                      br_if 2 (;@15;)
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 0
                                      br_if 0 (;@17;)
                                      br 3 (;@14;)
                                    end
                                  end
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      i32.const 0
                                      i32.load offset=1056
                                      local.tee 0
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 6
                                      local.get 0
                                      i32.ge_u
                                      br_if 1 (;@16;)
                                    end
                                    i32.const 0
                                    local.get 6
                                    i32.store offset=1056
                                  end
                                  i32.const 0
                                  local.set 0
                                  i32.const 0
                                  local.get 2
                                  i32.store offset=1492
                                  i32.const 0
                                  local.get 6
                                  i32.store offset=1488
                                  i32.const 0
                                  i32.const -1
                                  i32.store offset=1072
                                  i32.const 0
                                  i32.const 0
                                  i32.load offset=1512
                                  i32.store offset=1076
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1500
                                  loop  ;; label = @16
                                    local.get 0
                                    i32.const 1088
                                    i32.add
                                    local.get 0
                                    i32.const 1080
                                    i32.add
                                    local.tee 4
                                    i32.store
                                    local.get 0
                                    i32.const 1092
                                    i32.add
                                    local.get 4
                                    i32.store
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.tee 0
                                    i32.const 256
                                    i32.ne
                                    br_if 0 (;@16;)
                                  end
                                  local.get 6
                                  i32.const -8
                                  local.get 6
                                  i32.sub
                                  i32.const 7
                                  i32.and
                                  i32.const 0
                                  local.get 6
                                  i32.const 8
                                  i32.add
                                  i32.const 7
                                  i32.and
                                  select
                                  local.tee 0
                                  i32.add
                                  local.tee 4
                                  local.get 2
                                  i32.const -40
                                  i32.add
                                  local.tee 5
                                  local.get 0
                                  i32.sub
                                  local.tee 0
                                  i32.const 1
                                  i32.or
                                  i32.store offset=4
                                  i32.const 0
                                  i32.const 0
                                  i32.load offset=1528
                                  i32.store offset=1068
                                  i32.const 0
                                  local.get 0
                                  i32.store offset=1052
                                  i32.const 0
                                  local.get 4
                                  i32.store offset=1064
                                  local.get 6
                                  local.get 5
                                  i32.add
                                  i32.const 40
                                  i32.store offset=4
                                  br 2 (;@13;)
                                end
                                local.get 0
                                i32.load8_u offset=12
                                i32.const 8
                                i32.and
                                br_if 0 (;@14;)
                                local.get 6
                                local.get 4
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 5
                                local.get 4
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 4
                                i32.const -8
                                local.get 4
                                i32.sub
                                i32.const 7
                                i32.and
                                i32.const 0
                                local.get 4
                                i32.const 8
                                i32.add
                                i32.const 7
                                i32.and
                                select
                                local.tee 5
                                i32.add
                                local.tee 6
                                i32.const 0
                                i32.load offset=1052
                                local.get 2
                                i32.add
                                local.tee 8
                                local.get 5
                                i32.sub
                                local.tee 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 0
                                i32.const 4
                                i32.add
                                local.get 9
                                local.get 2
                                i32.add
                                i32.store
                                i32.const 0
                                i32.const 0
                                i32.load offset=1528
                                i32.store offset=1068
                                i32.const 0
                                local.get 5
                                i32.store offset=1052
                                i32.const 0
                                local.get 6
                                i32.store offset=1064
                                local.get 4
                                local.get 8
                                i32.add
                                i32.const 40
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 6
                                i32.const 0
                                i32.load offset=1056
                                i32.ge_u
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 6
                                i32.store offset=1056
                              end
                              local.get 6
                              local.get 2
                              i32.add
                              local.set 5
                              i32.const 1488
                              local.set 0
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              loop  ;; label = @22
                                                local.get 0
                                                i32.load
                                                local.get 5
                                                i32.eq
                                                br_if 1 (;@21;)
                                                local.get 0
                                                i32.load offset=8
                                                local.tee 0
                                                br_if 0 (;@22;)
                                                br 2 (;@20;)
                                              end
                                            end
                                            local.get 0
                                            i32.load8_u offset=12
                                            i32.const 8
                                            i32.and
                                            br_if 0 (;@20;)
                                            local.get 0
                                            local.get 6
                                            i32.store
                                            local.get 0
                                            local.get 0
                                            i32.load offset=4
                                            local.get 2
                                            i32.add
                                            i32.store offset=4
                                            local.get 6
                                            i32.const -8
                                            local.get 6
                                            i32.sub
                                            i32.const 7
                                            i32.and
                                            i32.const 0
                                            local.get 6
                                            i32.const 8
                                            i32.add
                                            i32.const 7
                                            i32.and
                                            select
                                            i32.add
                                            local.tee 2
                                            local.get 3
                                            i32.const 3
                                            i32.or
                                            i32.store offset=4
                                            local.get 5
                                            i32.const -8
                                            local.get 5
                                            i32.sub
                                            i32.const 7
                                            i32.and
                                            i32.const 0
                                            local.get 5
                                            i32.const 8
                                            i32.add
                                            i32.const 7
                                            i32.and
                                            select
                                            i32.add
                                            local.tee 6
                                            local.get 2
                                            i32.sub
                                            local.get 3
                                            i32.sub
                                            local.set 0
                                            local.get 2
                                            local.get 3
                                            i32.add
                                            local.set 5
                                            local.get 4
                                            local.get 6
                                            i32.eq
                                            br_if 1 (;@19;)
                                            i32.const 0
                                            i32.load offset=1060
                                            local.get 6
                                            i32.eq
                                            br_if 9 (;@11;)
                                            local.get 6
                                            i32.load offset=4
                                            local.tee 4
                                            i32.const 3
                                            i32.and
                                            i32.const 1
                                            i32.ne
                                            br_if 15 (;@5;)
                                            local.get 4
                                            i32.const -8
                                            i32.and
                                            local.set 7
                                            local.get 4
                                            i32.const 255
                                            i32.gt_u
                                            br_if 10 (;@10;)
                                            local.get 6
                                            i32.load offset=12
                                            local.tee 3
                                            local.get 6
                                            i32.load offset=8
                                            local.tee 9
                                            i32.eq
                                            br_if 11 (;@9;)
                                            local.get 3
                                            local.get 9
                                            i32.store offset=8
                                            local.get 9
                                            local.get 3
                                            i32.store offset=12
                                            br 14 (;@6;)
                                          end
                                          i32.const 1488
                                          local.set 0
                                          block  ;; label = @20
                                            loop  ;; label = @21
                                              block  ;; label = @22
                                                local.get 0
                                                i32.load
                                                local.tee 5
                                                local.get 4
                                                i32.gt_u
                                                br_if 0 (;@22;)
                                                local.get 5
                                                local.get 0
                                                i32.load offset=4
                                                i32.add
                                                local.tee 5
                                                local.get 4
                                                i32.gt_u
                                                br_if 2 (;@20;)
                                              end
                                              local.get 0
                                              i32.load offset=8
                                              local.set 0
                                              br 0 (;@21;)
                                            end
                                          end
                                          local.get 6
                                          i32.const -8
                                          local.get 6
                                          i32.sub
                                          i32.const 7
                                          i32.and
                                          i32.const 0
                                          local.get 6
                                          i32.const 8
                                          i32.add
                                          i32.const 7
                                          i32.and
                                          select
                                          local.tee 0
                                          i32.add
                                          local.tee 8
                                          local.get 2
                                          i32.const -40
                                          i32.add
                                          local.tee 9
                                          local.get 0
                                          i32.sub
                                          local.tee 0
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          local.get 6
                                          local.get 9
                                          i32.add
                                          i32.const 40
                                          i32.store offset=4
                                          local.get 4
                                          local.get 5
                                          i32.const 39
                                          local.get 5
                                          i32.sub
                                          i32.const 7
                                          i32.and
                                          i32.const 0
                                          local.get 5
                                          i32.const -39
                                          i32.add
                                          i32.const 7
                                          i32.and
                                          select
                                          i32.add
                                          i32.const -47
                                          i32.add
                                          local.tee 9
                                          local.get 9
                                          local.get 4
                                          i32.const 16
                                          i32.add
                                          i32.lt_u
                                          select
                                          local.tee 9
                                          i32.const 27
                                          i32.store offset=4
                                          i32.const 0
                                          i32.const 0
                                          i32.load offset=1528
                                          i32.store offset=1068
                                          i32.const 0
                                          local.get 0
                                          i32.store offset=1052
                                          i32.const 0
                                          local.get 8
                                          i32.store offset=1064
                                          local.get 9
                                          i32.const 16
                                          i32.add
                                          i32.const 0
                                          i64.load offset=1496 align=4
                                          i64.store align=4
                                          local.get 9
                                          i32.const 0
                                          i64.load offset=1488 align=4
                                          i64.store offset=8 align=4
                                          i32.const 0
                                          local.get 2
                                          i32.store offset=1492
                                          i32.const 0
                                          local.get 6
                                          i32.store offset=1488
                                          i32.const 0
                                          local.get 9
                                          i32.const 8
                                          i32.add
                                          i32.store offset=1496
                                          i32.const 0
                                          i32.const 0
                                          i32.store offset=1500
                                          local.get 9
                                          i32.const 28
                                          i32.add
                                          local.set 0
                                          loop  ;; label = @20
                                            local.get 0
                                            i32.const 7
                                            i32.store
                                            local.get 0
                                            i32.const 4
                                            i32.add
                                            local.tee 0
                                            local.get 5
                                            i32.lt_u
                                            br_if 0 (;@20;)
                                          end
                                          local.get 9
                                          local.get 4
                                          i32.eq
                                          br_if 6 (;@13;)
                                          local.get 9
                                          i32.const 4
                                          i32.add
                                          local.tee 0
                                          local.get 0
                                          i32.load
                                          i32.const -2
                                          i32.and
                                          i32.store
                                          local.get 9
                                          local.get 9
                                          local.get 4
                                          i32.sub
                                          local.tee 2
                                          i32.store
                                          local.get 4
                                          local.get 2
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          block  ;; label = @20
                                            local.get 2
                                            i32.const 255
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 2
                                            i32.const 3
                                            i32.shr_u
                                            local.tee 5
                                            i32.const 3
                                            i32.shl
                                            i32.const 1080
                                            i32.add
                                            local.set 0
                                            i32.const 0
                                            i32.load offset=1040
                                            local.tee 6
                                            i32.const 1
                                            local.get 5
                                            i32.shl
                                            local.tee 5
                                            i32.and
                                            i32.eqz
                                            br_if 2 (;@18;)
                                            local.get 0
                                            i32.load offset=8
                                            local.set 5
                                            br 3 (;@17;)
                                          end
                                          i32.const 0
                                          local.set 0
                                          block  ;; label = @20
                                            local.get 2
                                            i32.const 8
                                            i32.shr_u
                                            local.tee 5
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 31
                                            local.set 0
                                            local.get 2
                                            i32.const 16777215
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 2
                                            i32.const 14
                                            local.get 5
                                            local.get 5
                                            i32.const 1048320
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 8
                                            i32.and
                                            local.tee 0
                                            i32.shl
                                            local.tee 5
                                            i32.const 520192
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 4
                                            i32.and
                                            local.tee 6
                                            local.get 0
                                            i32.or
                                            local.get 5
                                            local.get 6
                                            i32.shl
                                            local.tee 0
                                            i32.const 245760
                                            i32.add
                                            i32.const 16
                                            i32.shr_u
                                            i32.const 2
                                            i32.and
                                            local.tee 5
                                            i32.or
                                            i32.sub
                                            local.get 0
                                            local.get 5
                                            i32.shl
                                            i32.const 15
                                            i32.shr_u
                                            i32.add
                                            local.tee 0
                                            i32.const 7
                                            i32.add
                                            i32.shr_u
                                            i32.const 1
                                            i32.and
                                            local.get 0
                                            i32.const 1
                                            i32.shl
                                            i32.or
                                            local.set 0
                                          end
                                          local.get 4
                                          i64.const 0
                                          i64.store offset=16 align=4
                                          local.get 4
                                          i32.const 28
                                          i32.add
                                          local.get 0
                                          i32.store
                                          local.get 0
                                          i32.const 2
                                          i32.shl
                                          i32.const 1344
                                          i32.add
                                          local.set 5
                                          i32.const 0
                                          i32.load offset=1044
                                          local.tee 6
                                          i32.const 1
                                          local.get 0
                                          i32.shl
                                          local.tee 9
                                          i32.and
                                          i32.eqz
                                          br_if 3 (;@16;)
                                          local.get 2
                                          i32.const 0
                                          i32.const 25
                                          local.get 0
                                          i32.const 1
                                          i32.shr_u
                                          i32.sub
                                          local.get 0
                                          i32.const 31
                                          i32.eq
                                          select
                                          i32.shl
                                          local.set 0
                                          local.get 5
                                          i32.load
                                          local.set 6
                                          loop  ;; label = @20
                                            local.get 6
                                            local.tee 5
                                            i32.load offset=4
                                            i32.const -8
                                            i32.and
                                            local.get 2
                                            i32.eq
                                            br_if 6 (;@14;)
                                            local.get 0
                                            i32.const 29
                                            i32.shr_u
                                            local.set 6
                                            local.get 0
                                            i32.const 1
                                            i32.shl
                                            local.set 0
                                            local.get 5
                                            local.get 6
                                            i32.const 4
                                            i32.and
                                            i32.add
                                            i32.const 16
                                            i32.add
                                            local.tee 9
                                            i32.load
                                            local.tee 6
                                            br_if 0 (;@20;)
                                          end
                                          local.get 9
                                          local.get 4
                                          i32.store
                                          local.get 4
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.store
                                          br 4 (;@15;)
                                        end
                                        i32.const 0
                                        local.get 5
                                        i32.store offset=1064
                                        i32.const 0
                                        i32.const 0
                                        i32.load offset=1052
                                        local.get 0
                                        i32.add
                                        local.tee 0
                                        i32.store offset=1052
                                        local.get 5
                                        local.get 0
                                        i32.const 1
                                        i32.or
                                        i32.store offset=4
                                        br 14 (;@4;)
                                      end
                                      i32.const 0
                                      local.get 6
                                      local.get 5
                                      i32.or
                                      i32.store offset=1040
                                      local.get 0
                                      local.set 5
                                    end
                                    local.get 5
                                    local.get 4
                                    i32.store offset=12
                                    local.get 0
                                    local.get 4
                                    i32.store offset=8
                                    local.get 4
                                    local.get 0
                                    i32.store offset=12
                                    local.get 4
                                    local.get 5
                                    i32.store offset=8
                                    br 3 (;@13;)
                                  end
                                  local.get 5
                                  local.get 4
                                  i32.store
                                  i32.const 0
                                  local.get 6
                                  local.get 9
                                  i32.or
                                  i32.store offset=1044
                                  local.get 4
                                  i32.const 24
                                  i32.add
                                  local.get 5
                                  i32.store
                                end
                                local.get 4
                                local.get 4
                                i32.store offset=12
                                local.get 4
                                local.get 4
                                i32.store offset=8
                                br 1 (;@13;)
                              end
                              local.get 5
                              i32.load offset=8
                              local.tee 0
                              local.get 4
                              i32.store offset=12
                              local.get 5
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              i32.const 24
                              i32.add
                              i32.const 0
                              i32.store
                              local.get 4
                              local.get 5
                              i32.store offset=12
                              local.get 4
                              local.get 0
                              i32.store offset=8
                            end
                            i32.const 0
                            i32.load offset=1052
                            local.tee 0
                            local.get 3
                            i32.le_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=1064
                            local.tee 4
                            local.get 3
                            i32.add
                            local.tee 5
                            local.get 0
                            local.get 3
                            i32.sub
                            local.tee 0
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.get 0
                            i32.store offset=1052
                            i32.const 0
                            local.get 5
                            i32.store offset=1064
                            local.get 4
                            local.get 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 4
                            i32.const 8
                            i32.add
                            local.set 0
                            br 11 (;@1;)
                          end
                          i32.const 0
                          local.set 0
                          i32.const 0
                          i32.const 48
                          i32.store offset=1536
                          br 10 (;@1;)
                        end
                        i32.const 0
                        local.get 5
                        i32.store offset=1060
                        i32.const 0
                        i32.const 0
                        i32.load offset=1048
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store offset=1048
                        local.get 5
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 5
                        local.get 0
                        i32.add
                        local.get 0
                        i32.store
                        br 6 (;@4;)
                      end
                      local.get 6
                      i32.load offset=24
                      local.set 10
                      local.get 6
                      i32.load offset=12
                      local.tee 9
                      local.get 6
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 6
                      i32.load offset=8
                      local.tee 4
                      local.get 9
                      i32.store offset=12
                      local.get 9
                      local.get 4
                      i32.store offset=8
                      local.get 10
                      br_if 2 (;@7;)
                      br 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1040
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=1040
                    br 2 (;@6;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      i32.const 20
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 16
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      i32.eqz
                      br_if 1 (;@8;)
                    end
                    loop  ;; label = @9
                      local.get 4
                      local.set 8
                      local.get 3
                      local.tee 9
                      i32.const 20
                      i32.add
                      local.tee 4
                      i32.load
                      local.tee 3
                      br_if 0 (;@9;)
                      local.get 9
                      i32.const 16
                      i32.add
                      local.set 4
                      local.get 9
                      i32.load offset=16
                      local.tee 3
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    i32.const 0
                    i32.store
                    local.get 10
                    i32.eqz
                    br_if 2 (;@6;)
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 9
                  local.get 10
                  i32.eqz
                  br_if 1 (;@6;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=28
                      local.tee 3
                      i32.const 2
                      i32.shl
                      i32.const 1344
                      i32.add
                      local.tee 4
                      i32.load
                      local.get 6
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 10
                      i32.const 16
                      i32.const 20
                      local.get 10
                      i32.load offset=16
                      local.get 6
                      i32.eq
                      select
                      i32.add
                      local.get 9
                      i32.store
                      local.get 9
                      br_if 1 (;@8;)
                      br 3 (;@6;)
                    end
                    local.get 4
                    local.get 9
                    i32.store
                    local.get 9
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  local.get 9
                  local.get 10
                  i32.store offset=24
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=16
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 4
                    i32.store offset=16
                    local.get 4
                    local.get 9
                    i32.store offset=24
                  end
                  local.get 6
                  i32.const 20
                  i32.add
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 9
                  i32.const 20
                  i32.add
                  local.get 4
                  i32.store
                  local.get 4
                  local.get 9
                  i32.store offset=24
                  br 1 (;@6;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1044
                i32.const -2
                local.get 3
                i32.rotl
                i32.and
                i32.store offset=1044
              end
              local.get 7
              local.get 0
              i32.add
              local.set 0
              local.get 6
              local.get 7
              i32.add
              local.set 6
            end
            local.get 6
            local.get 6
            i32.load offset=4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 5
            local.get 0
            i32.add
            local.get 0
            i32.store
            local.get 5
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 3
                        i32.shr_u
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.const 1080
                        i32.add
                        local.set 0
                        i32.const 0
                        i32.load offset=1040
                        local.tee 3
                        i32.const 1
                        local.get 4
                        i32.shl
                        local.tee 4
                        i32.and
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        i32.load offset=8
                        local.set 4
                        br 2 (;@8;)
                      end
                      i32.const 0
                      local.set 4
                      block  ;; label = @10
                        local.get 0
                        i32.const 8
                        i32.shr_u
                        local.tee 3
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 31
                        local.set 4
                        local.get 0
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 14
                        local.get 3
                        local.get 3
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        local.tee 4
                        i32.shl
                        local.tee 3
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        local.tee 6
                        local.get 4
                        i32.or
                        local.get 3
                        local.get 6
                        i32.shl
                        local.tee 4
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        local.tee 3
                        i32.or
                        i32.sub
                        local.get 4
                        local.get 3
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        i32.add
                        local.tee 4
                        i32.const 7
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.or
                        local.set 4
                      end
                      local.get 5
                      local.get 4
                      i32.store offset=28
                      local.get 5
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.const 1344
                      i32.add
                      local.set 3
                      i32.const 0
                      i32.load offset=1044
                      local.tee 6
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 9
                      i32.and
                      i32.eqz
                      br_if 2 (;@7;)
                      local.get 0
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 4
                      local.get 3
                      i32.load
                      local.set 6
                      loop  ;; label = @10
                        local.get 6
                        local.tee 3
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 0
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 4
                        i32.const 29
                        i32.shr_u
                        local.set 6
                        local.get 4
                        i32.const 1
                        i32.shl
                        local.set 4
                        local.get 3
                        local.get 6
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 9
                        i32.load
                        local.tee 6
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      local.get 5
                      i32.store
                      local.get 5
                      local.get 3
                      i32.store offset=24
                      br 3 (;@6;)
                    end
                    i32.const 0
                    local.get 3
                    local.get 4
                    i32.or
                    i32.store offset=1040
                    local.get 0
                    local.set 4
                  end
                  local.get 4
                  local.get 5
                  i32.store offset=12
                  local.get 0
                  local.get 5
                  i32.store offset=8
                  local.get 5
                  local.get 0
                  i32.store offset=12
                  local.get 5
                  local.get 4
                  i32.store offset=8
                  br 3 (;@4;)
                end
                local.get 3
                local.get 5
                i32.store
                i32.const 0
                local.get 6
                local.get 9
                i32.or
                i32.store offset=1044
                local.get 5
                local.get 3
                i32.store offset=24
              end
              local.get 5
              local.get 5
              i32.store offset=12
              local.get 5
              local.get 5
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.tee 0
            local.get 5
            i32.store offset=12
            local.get 3
            local.get 5
            i32.store offset=8
            local.get 5
            i32.const 0
            i32.store offset=24
            local.get 5
            local.get 3
            i32.store offset=12
            local.get 5
            local.get 0
            i32.store offset=8
          end
          local.get 2
          i32.const 8
          i32.add
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1344
              i32.add
              local.tee 0
              i32.load
              i32.eq
              br_if 0 (;@5;)
              local.get 10
              i32.const 16
              i32.const 20
              local.get 10
              i32.load offset=16
              local.get 9
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            local.get 0
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          local.get 10
          i32.store offset=24
          block  ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 6
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 0
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        i32.const 0
        local.get 7
        i32.const -2
        local.get 4
        i32.rotl
        i32.and
        local.tee 7
        i32.store offset=1044
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 9
          local.get 5
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 9
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 8
        local.get 5
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 9
        local.get 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 8
        local.get 5
        i32.add
        local.get 5
        i32.store
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 3
                  i32.shr_u
                  local.tee 4
                  i32.const 3
                  i32.shl
                  i32.const 1080
                  i32.add
                  local.set 0
                  i32.const 0
                  i32.load offset=1040
                  local.tee 5
                  i32.const 1
                  local.get 4
                  i32.shl
                  local.tee 4
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 0
                  i32.load offset=8
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 5
                i32.const 8
                i32.shr_u
                local.tee 4
                i32.eqz
                br_if 2 (;@4;)
                i32.const 31
                local.set 0
                local.get 5
                i32.const 16777215
                i32.gt_u
                br_if 3 (;@3;)
                local.get 5
                i32.const 14
                local.get 4
                local.get 4
                i32.const 1048320
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 8
                i32.and
                local.tee 0
                i32.shl
                local.tee 4
                i32.const 520192
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 4
                i32.and
                local.tee 3
                local.get 0
                i32.or
                local.get 4
                local.get 3
                i32.shl
                local.tee 0
                i32.const 245760
                i32.add
                i32.const 16
                i32.shr_u
                i32.const 2
                i32.and
                local.tee 4
                i32.or
                i32.sub
                local.get 0
                local.get 4
                i32.shl
                i32.const 15
                i32.shr_u
                i32.add
                local.tee 0
                i32.const 7
                i32.add
                i32.shr_u
                i32.const 1
                i32.and
                local.get 0
                i32.const 1
                i32.shl
                i32.or
                local.set 0
                br 3 (;@3;)
              end
              i32.const 0
              local.get 5
              local.get 4
              i32.or
              i32.store offset=1040
              local.get 0
              local.set 4
            end
            local.get 4
            local.get 8
            i32.store offset=12
            local.get 0
            local.get 8
            i32.store offset=8
            local.get 8
            local.get 0
            i32.store offset=12
            local.get 8
            local.get 4
            i32.store offset=8
            br 2 (;@2;)
          end
          i32.const 0
          local.set 0
        end
        local.get 8
        local.get 0
        i32.store offset=28
        local.get 8
        i64.const 0
        i64.store offset=16 align=4
        local.get 0
        i32.const 2
        i32.shl
        i32.const 1344
        i32.add
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 1
              local.get 0
              i32.shl
              local.tee 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 4
              i32.load
              local.set 3
              loop  ;; label = @6
                local.get 3
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 5
                i32.eq
                br_if 3 (;@3;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 3
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 4
                local.get 3
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 6
                i32.load
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 6
              local.get 8
              i32.store
              local.get 8
              local.get 4
              i32.store offset=24
              br 1 (;@4;)
            end
            local.get 4
            local.get 8
            i32.store
            i32.const 0
            local.get 7
            local.get 3
            i32.or
            i32.store offset=1044
            local.get 8
            local.get 4
            i32.store offset=24
          end
          local.get 8
          local.get 8
          i32.store offset=12
          local.get 8
          local.get 8
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 8
        i32.store offset=12
        local.get 4
        local.get 8
        i32.store offset=8
        local.get 8
        i32.const 0
        i32.store offset=24
        local.get 8
        local.get 4
        i32.store offset=12
        local.get 8
        local.get 0
        i32.store offset=8
      end
      local.get 9
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $free (type 3) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 3) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.add
        local.tee 1
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 2
        i32.const -8
        i32.and
        local.tee 0
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            local.get 1
            local.get 1
            i32.load
            local.tee 2
            i32.sub
            local.tee 1
            i32.const 0
            i32.load offset=1056
            i32.lt_u
            br_if 2 (;@2;)
            local.get 2
            local.get 0
            i32.add
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1060
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 255
                      i32.gt_u
                      br_if 1 (;@8;)
                      local.get 1
                      i32.load offset=12
                      local.tee 4
                      local.get 1
                      i32.load offset=8
                      local.tee 5
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      local.get 5
                      i32.store offset=8
                      local.get 5
                      local.get 4
                      i32.store offset=12
                      local.get 1
                      local.get 3
                      i32.lt_u
                      br_if 6 (;@3;)
                      br 7 (;@2;)
                    end
                    local.get 3
                    i32.load offset=4
                    local.tee 2
                    i32.const 3
                    i32.and
                    i32.const 3
                    i32.ne
                    br_if 4 (;@4;)
                    local.get 3
                    i32.const 4
                    i32.add
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store
                    i32.const 0
                    local.get 0
                    i32.store offset=1048
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    return
                  end
                  local.get 1
                  i32.load offset=24
                  local.set 6
                  local.get 1
                  i32.load offset=12
                  local.tee 5
                  local.get 1
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 1
                  i32.load offset=8
                  local.tee 2
                  local.get 5
                  i32.store offset=12
                  local.get 5
                  local.get 2
                  i32.store offset=8
                  local.get 6
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1040
                i32.const -2
                local.get 2
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=1040
                local.get 1
                local.get 3
                i32.lt_u
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 5
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 5
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                local.get 6
                i32.eqz
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              i32.const 0
              local.set 5
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load offset=28
                  local.tee 4
                  i32.const 2
                  i32.shl
                  i32.const 1344
                  i32.add
                  local.tee 2
                  i32.load
                  local.get 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 1
                  i32.eq
                  select
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 5
              local.get 6
              i32.store offset=24
              block  ;; label = @6
                local.get 1
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.store offset=16
                local.get 2
                local.get 5
                i32.store offset=24
              end
              local.get 1
              i32.const 20
              i32.add
              i32.load
              local.tee 2
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              i32.const 20
              i32.add
              local.get 2
              i32.store
              local.get 2
              local.get 5
              i32.store offset=24
              local.get 1
              local.get 3
              i32.lt_u
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1044
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=1044
          end
          local.get 1
          local.get 3
          i32.ge_u
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 2
                          i32.const 2
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=1064
                          local.get 3
                          i32.eq
                          br_if 1 (;@10;)
                          i32.const 0
                          i32.load offset=1060
                          local.get 3
                          i32.eq
                          br_if 2 (;@9;)
                          local.get 2
                          i32.const -8
                          i32.and
                          local.get 0
                          i32.add
                          local.set 0
                          local.get 2
                          i32.const 255
                          i32.gt_u
                          br_if 3 (;@8;)
                          local.get 3
                          i32.load offset=12
                          local.tee 4
                          local.get 3
                          i32.load offset=8
                          local.tee 5
                          i32.eq
                          br_if 4 (;@7;)
                          local.get 4
                          local.get 5
                          i32.store offset=8
                          local.get 5
                          local.get 4
                          i32.store offset=12
                          br 7 (;@4;)
                        end
                        local.get 3
                        i32.const 4
                        i32.add
                        local.get 2
                        i32.const -2
                        i32.and
                        i32.store
                        local.get 1
                        local.get 0
                        i32.add
                        local.get 0
                        i32.store
                        local.get 1
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 7 (;@3;)
                      end
                      i32.const 0
                      local.get 1
                      i32.store offset=1064
                      i32.const 0
                      i32.const 0
                      i32.load offset=1052
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.store offset=1052
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      i32.const 0
                      i32.load offset=1060
                      i32.ne
                      br_if 7 (;@2;)
                      i32.const 0
                      i32.const 0
                      i32.store offset=1048
                      i32.const 0
                      i32.const 0
                      i32.store offset=1060
                      return
                    end
                    i32.const 0
                    local.get 1
                    i32.store offset=1060
                    i32.const 0
                    i32.const 0
                    i32.load offset=1048
                    local.get 0
                    i32.add
                    local.tee 0
                    i32.store offset=1048
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                    return
                  end
                  local.get 3
                  i32.load offset=24
                  local.set 6
                  local.get 3
                  i32.load offset=12
                  local.tee 5
                  local.get 3
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 3
                  i32.load offset=8
                  local.tee 2
                  local.get 5
                  i32.store offset=12
                  local.get 5
                  local.get 2
                  i32.store offset=8
                  local.get 6
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1040
                i32.const -2
                local.get 2
                i32.const 3
                i32.shr_u
                i32.rotl
                i32.and
                i32.store offset=1040
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  i32.eqz
                  br_if 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 5
                  i32.const 20
                  i32.add
                  local.tee 2
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 5
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                local.get 6
                i32.eqz
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              i32.const 0
              local.set 5
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load offset=28
                  local.tee 4
                  i32.const 2
                  i32.shl
                  i32.const 1344
                  i32.add
                  local.tee 2
                  i32.load
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 3
                  i32.eq
                  select
                  i32.add
                  local.get 5
                  i32.store
                  local.get 5
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
                local.get 2
                local.get 5
                i32.store
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 5
              local.get 6
              i32.store offset=24
              block  ;; label = @6
                local.get 3
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.store offset=16
                local.get 2
                local.get 5
                i32.store offset=24
              end
              local.get 3
              i32.const 20
              i32.add
              i32.load
              local.tee 2
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              i32.const 20
              i32.add
              local.get 2
              i32.store
              local.get 2
              local.get 5
              i32.store offset=24
              br 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1044
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=1044
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=1060
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 0
          i32.store offset=1048
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 3
                      i32.shr_u
                      local.tee 2
                      i32.const 3
                      i32.shl
                      i32.const 1080
                      i32.add
                      local.set 0
                      i32.const 0
                      i32.load offset=1040
                      local.tee 4
                      i32.const 1
                      local.get 2
                      i32.shl
                      local.tee 2
                      i32.and
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 0
                      i32.load offset=8
                      local.set 2
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 2
                    block  ;; label = @9
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 2
                      local.get 0
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 14
                      local.get 4
                      local.get 4
                      i32.const 1048320
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 8
                      i32.and
                      local.tee 2
                      i32.shl
                      local.tee 4
                      i32.const 520192
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 4
                      i32.and
                      local.tee 5
                      local.get 2
                      i32.or
                      local.get 4
                      local.get 5
                      i32.shl
                      local.tee 2
                      i32.const 245760
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 2
                      i32.and
                      local.tee 4
                      i32.or
                      i32.sub
                      local.get 2
                      local.get 4
                      i32.shl
                      i32.const 15
                      i32.shr_u
                      i32.add
                      local.tee 2
                      i32.const 7
                      i32.add
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 2
                      i32.const 1
                      i32.shl
                      i32.or
                      local.set 2
                    end
                    local.get 1
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 1
                    i32.const 28
                    i32.add
                    local.get 2
                    i32.store
                    local.get 2
                    i32.const 2
                    i32.shl
                    i32.const 1344
                    i32.add
                    local.set 4
                    i32.const 0
                    i32.load offset=1044
                    local.tee 5
                    i32.const 1
                    local.get 2
                    i32.shl
                    local.tee 3
                    i32.and
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 2
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 2
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 2
                    local.get 4
                    i32.load
                    local.set 5
                    loop  ;; label = @9
                      local.get 5
                      local.tee 4
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 5 (;@4;)
                      local.get 2
                      i32.const 29
                      i32.shr_u
                      local.set 5
                      local.get 2
                      i32.const 1
                      i32.shl
                      local.set 2
                      local.get 4
                      local.get 5
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 3
                      i32.load
                      local.tee 5
                      br_if 0 (;@9;)
                    end
                    local.get 3
                    local.get 1
                    i32.store
                    local.get 1
                    i32.const 24
                    i32.add
                    local.get 4
                    i32.store
                    br 3 (;@5;)
                  end
                  i32.const 0
                  local.get 4
                  local.get 2
                  i32.or
                  i32.store offset=1040
                  local.get 0
                  local.set 2
                end
                local.get 2
                local.get 1
                i32.store offset=12
                local.get 0
                local.get 1
                i32.store offset=8
                local.get 1
                local.get 0
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                return
              end
              local.get 4
              local.get 1
              i32.store
              i32.const 0
              local.get 5
              local.get 3
              i32.or
              i32.store offset=1044
              local.get 1
              i32.const 24
              i32.add
              local.get 4
              i32.store
            end
            local.get 1
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.tee 0
          local.get 1
          i32.store offset=12
          local.get 4
          local.get 1
          i32.store offset=8
          local.get 1
          i32.const 24
          i32.add
          i32.const 0
          i32.store
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 0
          i32.store offset=8
        end
        i32.const 0
        i32.const 0
        i32.load offset=1072
        i32.const -1
        i32.add
        local.tee 1
        i32.store offset=1072
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
      end
      return
    end
    i32.const 1496
    local.set 1
    loop  ;; label = @1
      local.get 1
      i32.load
      local.tee 0
      i32.const 8
      i32.add
      local.set 1
      local.get 0
      br_if 0 (;@1;)
    end
    i32.const 0
    i32.const -1
    i32.store offset=1072)
  (func $calloc (type 2) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          i32.mul
          local.set 2
          block  ;; label = @4
            local.get 1
            local.get 0
            i32.or
            i32.const 65536
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -1
            local.get 2
            local.get 0
            i32.div_u
            local.get 1
            i32.eq
            select
            local.set 2
          end
          local.get 2
          call $dlmalloc
          local.tee 0
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        call $dlmalloc
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $_Exit (type 3) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $close (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      i32.store offset=1536
      i32.const -1
      return
    end
    i32.const 0)
  (func $po_map_assertvalid (type 3) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 0
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 0
          i32.load
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          i32.load
          i32.const -1
          i32.le_s
          br_if 2 (;@1;)
          local.get 0
          i32.const 24
          i32.add
          local.set 0
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          local.get 1
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      return
    end
    call $abort
    unreachable)
  (func $__wasilibc_init_preopen (type 7)
    (local i32 i32)
    block  ;; label = @1
      i32.const 16
      call $malloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $calloc
      local.tee 1
      i32.store offset=4
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i64.const 4
        i64.store offset=8 align=4
        local.get 0
        i32.const 1
        i32.store
        local.get 0
        call $po_map_assertvalid
        i32.const 0
        local.get 0
        i32.store offset=1540
        local.get 0
        call $po_map_assertvalid
        return
      end
      local.get 0
      call $free
    end
    i32.const 0
    i32.const 0
    i32.store offset=1540
    unreachable
    unreachable)
  (func $__wasilibc_register_preopened_fd (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    i32.load offset=1540
    call $po_map_assertvalid
    i32.const -1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1540
      local.tee 4
      call $po_map_assertvalid
      local.get 0
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load offset=12
          local.tee 5
          local.get 4
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          i32.const 24
          local.get 5
          i32.const 1
          i32.shl
          call $calloc
          local.tee 6
          i32.eqz
          br_if 2 (;@1;)
          local.get 6
          local.get 4
          i32.load offset=4
          local.get 4
          i32.const 12
          i32.add
          local.tee 5
          i32.load
          i32.const 24
          i32.mul
          call $memcpy
          drop
          local.get 4
          i32.load offset=4
          call $free
          local.get 4
          local.get 6
          i32.store offset=4
          local.get 4
          i32.const 8
          i32.add
          local.tee 7
          local.get 7
          i32.load
          i32.const 1
          i32.shl
          i32.store
          local.get 5
          i32.load
          local.set 5
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=4
        local.set 6
      end
      local.get 4
      i32.const 12
      i32.add
      local.get 5
      i32.const 1
      i32.add
      i32.store
      local.get 1
      call $strdup
      local.set 7
      local.get 6
      local.get 5
      i32.const 24
      i32.mul
      i32.add
      local.tee 1
      local.get 0
      i32.store offset=4
      local.get 1
      local.get 7
      i32.store
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.const 8
        i32.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=1536
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i64.load offset=16
      i64.store offset=8
      local.get 1
      local.get 2
      i64.load offset=24
      i64.store offset=16
      local.get 4
      call $po_map_assertvalid
      local.get 4
      call $po_map_assertvalid
      i32.const 0
      local.set 3
      i32.const 0
      local.get 4
      i32.store offset=1540
    end
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 3)
  (func $abort (type 7)
    unreachable
    unreachable)
  (func $sbrk (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 16
        i32.shl
        return
      end
      i32.const 0
      i32.const 48
      i32.store offset=1536
      i32.const -1
      return
    end
    call $abort
    unreachable)
  (func $dummy (type 7))
  (func $__prepare_for_exit (type 7)
    call $dummy
    call $__stdio_exit)
  (func $__ofl_lock (type 8) (result i32)
    i32.const 1548)
  (func $__stdio_exit (type 7)
    (local i32 i32 i32)
    block  ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=24
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=32
          call_indirect (type 0)
          drop
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          i32.sub
          i64.extend_i32_s
          i32.const 0
          local.get 0
          i32.load offset=36
          call_indirect (type 1)
          drop
        end
        local.get 0
        i32.load offset=52
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1552
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=2712
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1552
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
    end)
  (func $__towrite (type 4) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=60
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=60
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i64.const 0
      i64.store offset=4 align=4
      local.get 0
      local.get 0
      i32.load offset=40
      local.tee 1
      i32.store offset=24
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=44
      i32.add
      i32.store offset=16
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 32
    i32.or
    i32.store
    i32.const -1)
  (func $__fwritex (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 6
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.const 16
        i32.add
        i32.load
        local.set 3
      end
      block  ;; label = @2
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 4
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=32
        call_indirect (type 0)
        return
      end
      i32.const 0
      local.set 5
      block  ;; label = @2
        local.get 2
        i32.load offset=64
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        local.get 0
        local.set 6
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 1
          local.get 3
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 6
          local.get 1
          i32.add
          local.set 7
          local.get 6
          i32.const -1
          i32.add
          local.tee 8
          local.set 6
          local.get 7
          i32.const -1
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.sub
        i32.const 1
        i32.add
        local.tee 5
        local.get 2
        i32.load offset=32
        call_indirect (type 0)
        local.tee 6
        local.get 5
        i32.lt_u
        br_if 1 (;@1;)
        local.get 8
        local.get 1
        i32.add
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const 20
        i32.add
        i32.load
        local.set 4
        local.get 3
        i32.const -1
        i32.add
        local.set 1
      end
      local.get 4
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      i32.const 20
      i32.add
      local.tee 3
      local.get 3
      i32.load
      local.get 1
      i32.add
      i32.store
      local.get 5
      local.get 1
      i32.add
      return
    end
    local.get 6)
  (func $fwrite (type 5) (param i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 2
      local.get 1
      i32.mul
      local.tee 4
      local.get 3
      call $__fwritex
      local.tee 0
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 0
    local.get 1
    i32.div_u)
  (func $fputs (type 2) (param i32 i32) (result i32)
    (local i32)
    i32.const -1
    i32.const 0
    local.get 0
    call $strlen
    local.tee 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $__overflow (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store8 offset=15
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const -1
        local.set 3
        local.get 0
        call $__towrite
        br_if 1 (;@1;)
        local.get 0
        i32.const 16
        i32.add
        i32.load
        local.set 3
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.tee 4
          local.get 3
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=64
          local.get 1
          i32.const 255
          i32.and
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const -1
        local.set 3
        local.get 0
        local.get 2
        i32.const 15
        i32.add
        i32.const 1
        local.get 0
        i32.load offset=32
        call_indirect (type 0)
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.load8_u offset=15
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 20
      i32.add
      local.get 4
      i32.const 1
      i32.add
      i32.store
      local.get 4
      local.get 1
      i32.store8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 3)
  (func $puts (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 2600
      call $fputs
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=2664
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=2620
        local.tee 0
        i32.const 0
        i32.load offset=2616
        i32.eq
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.const 1
        i32.add
        i32.store offset=2620
        local.get 0
        i32.const 10
        i32.store8
        i32.const 0
        return
      end
      i32.const 2600
      i32.const 10
      call $__overflow
      i32.const 31
      i32.shr_s
      return
    end
    i32.const -1)
  (func $__stdio_close (type 4) (param i32) (result i32)
    local.get 0
    i32.load offset=56
    call $close)
  (func $writev (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const -1
          i32.le_s
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          i32.const 12
          i32.add
          call $__wasi_fd_write
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          i32.const 0
          local.get 2
          i32.store offset=1536
          i32.const -1
          local.set 4
          br 2 (;@1;)
        end
        i32.const 0
        i32.const 28
        i32.store offset=1536
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 4)
  (func $__stdio_write (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=24
    local.tee 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=20
    local.get 1
    i32.sub
    local.tee 1
    i32.store offset=4
    i32.const 2
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.add
          local.tee 5
          local.get 0
          i32.load offset=56
          local.get 3
          i32.const 2
          call $writev
          local.tee 6
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          local.set 1
          local.get 0
          i32.const 56
          i32.add
          local.set 7
          loop  ;; label = @4
            local.get 6
            i32.const -1
            i32.le_s
            br_if 2 (;@2;)
            local.get 1
            i32.const 8
            i32.add
            local.get 1
            local.get 6
            local.get 1
            i32.load offset=4
            local.tee 8
            i32.gt_u
            local.tee 9
            select
            local.tee 1
            local.get 1
            i32.load
            local.get 6
            local.get 8
            i32.const 0
            local.get 9
            select
            i32.sub
            local.tee 8
            i32.add
            i32.store
            local.get 1
            local.get 1
            i32.load offset=4
            local.get 8
            i32.sub
            i32.store offset=4
            local.get 5
            local.get 6
            i32.sub
            local.set 5
            local.get 7
            i32.load
            local.get 1
            local.get 4
            local.get 9
            i32.sub
            local.tee 4
            call $writev
            local.tee 9
            local.set 6
            local.get 5
            local.get 9
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.load offset=40
        local.tee 1
        i32.store
        local.get 0
        i32.const 20
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=44
        i32.add
        i32.store offset=16
        local.get 2
        local.set 6
        br 1 (;@1;)
      end
      local.get 0
      i64.const 0
      i64.store offset=16
      i32.const 0
      local.set 6
      local.get 0
      i32.const 24
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      local.get 4
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load offset=4
      i32.sub
      local.set 6
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 6)
  (func $__isatty (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 1
          i32.const 8
          i32.add
          call $__wasi_fd_fdstat_get
          local.tee 0
          br_if 0 (;@3;)
          i32.const 59
          local.set 0
          local.get 1
          i32.load8_u offset=8
          i32.const 2
          i32.ne
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u offset=16
          i32.const 36
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        local.get 0
        i32.store offset=1536
        br 1 (;@1;)
      end
      i32.const 1
      local.set 2
    end
    local.get 1
    i32.const 32
    i32.add
    global.set 0
    local.get 2)
  (func $__stdout_write (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1
    i32.store offset=32
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 64
        i32.and
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=56
        call $__isatty
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 2
      call $__stdio_write
      return
    end
    local.get 0
    i32.const -1
    i32.store offset=64
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write)
  (func $lseek (type 1) (param i32 i64 i32) (result i64)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i32.const 8
        i32.add
        call $__wasi_fd_seek
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 70
        local.get 0
        local.get 0
        i32.const 76
        i32.eq
        select
        i32.store offset=1536
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $__stdio_seek (type 1) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=56
    local.get 1
    local.get 2
    call $lseek)
  (func $memcpy (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.set 3
            block  ;; label = @5
              loop  ;; label = @6
                local.get 3
                local.get 1
                i32.load8_u
                i32.store8
                local.get 2
                i32.const -1
                i32.add
                local.set 4
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 2
                i32.const 1
                i32.eq
                br_if 1 (;@5;)
                local.get 4
                local.set 2
                local.get 1
                i32.const 3
                i32.and
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.const 3
            i32.and
            local.tee 2
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 2
          local.set 4
          local.get 0
          local.tee 3
          i32.const 3
          i32.and
          local.tee 2
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const -16
            i32.add
            local.set 2
            loop  ;; label = @5
              local.get 3
              local.get 1
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 16
              i32.add
              local.set 3
              local.get 1
              i32.const 16
              i32.add
              local.set 1
              local.get 4
              i32.const -16
              i32.add
              local.tee 4
              i32.const 15
              i32.gt_u
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 4
          local.set 2
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i64.load align=4
          i64.store align=4
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 8
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 3
          i32.const 4
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 3
          i32.const 2
          i32.add
          local.set 3
          local.get 1
          i32.const 2
          i32.add
          local.set 1
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i32.const 2
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 1
            i32.ne
            br_if 2 (;@2;)
            local.get 3
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 3
            local.get 1
            i32.load
            local.tee 5
            i32.store8
            local.get 3
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 4
            i32.const -3
            i32.add
            local.set 6
            local.get 3
            i32.const 3
            i32.add
            local.set 7
            local.get 4
            i32.const -20
            i32.add
            i32.const -16
            i32.and
            local.set 8
            i32.const 0
            local.set 2
            loop  ;; label = @5
              local.get 7
              local.get 2
              i32.add
              local.tee 3
              local.get 1
              local.get 2
              i32.add
              local.tee 9
              i32.const 4
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 9
              i32.const 8
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 9
              i32.const 12
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 9
              i32.const 16
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.const -16
              i32.add
              local.tee 6
              i32.const 16
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 7
            local.get 2
            i32.add
            local.set 3
            local.get 1
            local.get 2
            i32.add
            i32.const 3
            i32.add
            local.set 1
            local.get 4
            i32.const -19
            i32.add
            local.get 8
            i32.sub
            local.set 4
            br 2 (;@2;)
          end
          local.get 3
          local.get 1
          i32.load
          local.tee 5
          i32.store8
          local.get 4
          i32.const -1
          i32.add
          local.set 6
          local.get 3
          i32.const 1
          i32.add
          local.set 7
          local.get 4
          i32.const -20
          i32.add
          i32.const -16
          i32.and
          local.set 8
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 7
            local.get 2
            i32.add
            local.tee 3
            local.get 1
            local.get 2
            i32.add
            local.tee 9
            i32.const 4
            i32.add
            i32.load
            local.tee 10
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 4
            i32.add
            local.get 9
            i32.const 8
            i32.add
            i32.load
            local.tee 5
            i32.const 24
            i32.shl
            local.get 10
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 8
            i32.add
            local.get 9
            i32.const 12
            i32.add
            i32.load
            local.tee 10
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 12
            i32.add
            local.get 9
            i32.const 16
            i32.add
            i32.load
            local.tee 5
            i32.const 24
            i32.shl
            local.get 10
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 2
            i32.const 16
            i32.add
            local.set 2
            local.get 6
            i32.const -16
            i32.add
            local.tee 6
            i32.const 18
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 7
          local.get 2
          i32.add
          local.set 3
          local.get 1
          local.get 2
          i32.add
          i32.const 1
          i32.add
          local.set 1
          local.get 4
          i32.const -17
          i32.add
          local.get 8
          i32.sub
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 1
        i32.load
        local.tee 5
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 4
        i32.const -2
        i32.add
        local.set 6
        local.get 3
        i32.const 2
        i32.add
        local.set 7
        local.get 4
        i32.const -20
        i32.add
        i32.const -16
        i32.and
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 7
          local.get 2
          i32.add
          local.tee 3
          local.get 1
          local.get 2
          i32.add
          local.tee 9
          i32.const 4
          i32.add
          i32.load
          local.tee 10
          i32.const 16
          i32.shl
          local.get 5
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 4
          i32.add
          local.get 9
          i32.const 8
          i32.add
          i32.load
          local.tee 5
          i32.const 16
          i32.shl
          local.get 10
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 8
          i32.add
          local.get 9
          i32.const 12
          i32.add
          i32.load
          local.tee 10
          i32.const 16
          i32.shl
          local.get 5
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 12
          i32.add
          local.get 9
          i32.const 16
          i32.add
          i32.load
          local.tee 5
          i32.const 16
          i32.shl
          local.get 10
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 6
          i32.const -16
          i32.add
          local.tee 6
          i32.const 17
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 7
        local.get 2
        i32.add
        local.set 3
        local.get 1
        local.get 2
        i32.add
        i32.const 2
        i32.add
        local.set 1
        local.get 4
        i32.const -18
        i32.add
        local.get 8
        i32.sub
        local.set 4
      end
      block  ;; label = @2
        local.get 4
        i32.const 16
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        local.get 1
        i32.load8_u offset=8
        i32.store8 offset=8
        local.get 3
        local.get 1
        i32.load8_u offset=9
        i32.store8 offset=9
        local.get 3
        local.get 1
        i32.load8_u offset=10
        i32.store8 offset=10
        local.get 3
        local.get 1
        i32.load8_u offset=11
        i32.store8 offset=11
        local.get 3
        local.get 1
        i32.load8_u offset=12
        i32.store8 offset=12
        local.get 3
        local.get 1
        i32.load8_u offset=13
        i32.store8 offset=13
        local.get 3
        local.get 1
        i32.load8_u offset=14
        i32.store8 offset=14
        local.get 3
        local.get 1
        i32.load8_u offset=15
        i32.store8 offset=15
        local.get 3
        i32.const 16
        i32.add
        local.set 3
        local.get 1
        i32.const 16
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        i32.const 2
        i32.add
        local.set 3
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 5
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 6
      i64.const 32
      i64.shl
      local.get 6
      i64.or
      local.set 6
      local.get 3
      local.get 5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 6
        i64.store
        local.get 1
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strdup (type 4) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      return
    end
    i32.const 0)
  (func $strlen (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.load8_u
            local.set 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            local.set 1
            local.get 2
            br_if 0 (;@4;)
          end
          local.get 3
          i32.const -1
          i32.add
          local.get 0
          i32.sub
          return
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 255
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 1
          i32.load8_u offset=1
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          local.set 1
          local.get 2
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 0
        i32.sub
        return
      end
      local.get 0
      local.get 0
      i32.sub
      return
    end
    local.get 1
    local.get 0
    i32.sub)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 68256))
  (global (;1;) i32 (i32.const 68256))
  (global (;2;) i32 (i32.const 2716))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "_start" (func $_start))
  (elem (;0;) (i32.const 1) $__stdio_write $__stdio_close $__stdout_write $__stdio_seek)
  (data (;0;) (i32.const 1024) "hello!\00")
  (data (;1;) (i32.const 1040) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (;2;) (i32.const 2600) "\05\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\04\00\00\00(\06\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00(\0a\00\00"))
