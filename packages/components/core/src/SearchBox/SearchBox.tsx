import {
  AudioOutlined,
  CloseCircleFilled,
  SearchOutlined,
} from '@ant-design/icons';
import { ComponentPropsWithoutRef, ElementType, ReactNode } from 'react';
import { Button } from '../Button';
import { Input } from '../Input';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { Text } from '../Text';
export type SearchBoxProps = ComponentPropsWithoutRef<ElementType> & {
  colorSchema?: 'default' | 'secondary' | 'primary' | 'danger';
  iconButton?: ReactNode;
  label?: string;
  showCloseIcon?: boolean;
  showVoiceIcon?: boolean;
  onClear?: () => void;
};

const StyledSearchBox = styled(Space, {
  input: {
    border: 'none',
    background: 'transparent',
  },
  padding: '4px 12px',
  'input:focus': {
    outline: 'none',
    div: {
      backgroundColor: 'blue',
    },
  },
  width: 'fit-content',
  border: '1px solid $gray9',
  alignItems: 'center',
  justifyContent: 'space-between',
  '&:focus-within': {
    borderColor: '$blue9',
  },
  variants: {
    size: {
      sm: {
        padding: '1px 8px',
      },
      md: {
        padding: '5px 12px',
      },
      lg: {
        padding: '8px 12px',
      },
      fullWidth: {
        width: '100%',
        padding: '1px 8px',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
export const SearchBox = ({
  disabled,
  defaultValue,
  placeholder,
  colorSchema = 'secondary',
  iconButton,
  label,
  showCloseIcon = false,
  showVoiceIcon = false,
  onClear,
  ...props
}: SearchBoxProps) => {
  return (
    <Space>
      <StyledSearchBox {...props}>
        <Input defaultValue={defaultValue} placeholder={placeholder} />
        {showCloseIcon ? (
          <CloseCircleFilled onClick={onClear} style={{ color: '#bfbfbf' }} />
        ) : null}
        {showVoiceIcon ? <AudioOutlined style={{ color: '#1890FF' }} /> : null}
      </StyledSearchBox>
      <Button colorScheme={colorSchema} size="sm" variant="square">
        {iconButton ? iconButton : <SearchOutlined />}
        {label ? <Text css={{ margin: '0 10px' }}>{label}</Text> : null}
      </Button>
    </Space>
  );
};