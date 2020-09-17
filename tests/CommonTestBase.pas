unit CommonTestBase;

{
Copyright (c) 2011+, Health Intersections Pty Ltd (http://www.healthintersections.com.au)
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to
   endorse or promote products derived from this software without specific
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
}

interface

uses
  Windows, SysUtils, Classes, {$IFDEF FPC} FPCUnit {$ELSE}DUnitX.TestFramework {$ENDIF};

type

  { TCommonTestCase }

  TCommonTestCase = class {$IFDEF FPC} (TTestCase) {$ENDIF}
  protected
    {$IFDEF FPC}
    FName : String;
    function GetTestName: string; override;
    {$ENDIF}
    procedure assertEqual(left, right : String; message : String);
  public
    {$IFDEF FPC}
    constructor Create(name : String);
    {$ENDIF}
    procedure TestCase(name : String); virtual;
  published
    {$IFDEF FPC}
    procedure Test;
    {$ENDIF}
  end;

implementation

{ TCommonTestCase }

procedure TCommonTestCase.TestCase(name: String);
begin
  // nothing - override this
end;

procedure TCommonTestCase.assertEqual(left, right: String; message: String);
begin
  {$IFDEF FPC}
  TAssert.AssertEquals(message, left, right);
  {$ELSE}
  Assert.AreEqual(left, right, message);
  {$ENDIF}
end;

{$IFDEF FPC}

constructor TCommonTestCase.Create(name : String);
begin
  inherited CreateWith('Test', name);
  FName := name;
end;

function TCommonTestCase.GetTestName: string;
begin
  Result := FName;
end;

procedure TCommonTestCase.Test;
begin
  TestCase(FName);
end;

{$ENDIF}
end.
